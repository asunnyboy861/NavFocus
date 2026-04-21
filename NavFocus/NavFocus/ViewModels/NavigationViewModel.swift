import Foundation
import MapKit
import CoreLocation
import Combine

@MainActor
class NavigationViewModel: ObservableObject {
    @Published var route: MKRoute?
    @Published var currentStep: NavigationStep?
    @Published var steps: [NavigationStep] = []
    @Published var currentStepIndex: Int = 0
    @Published var distanceToNextTurn: Double = 0
    @Published var isNavigating = false
    @Published var transportType: MKDirectionsTransportType = .automobile
    @Published var destinationName: String = ""
    @Published var destinationCoordinate: CLLocationCoordinate2D?
    @Published var eta: TimeInterval = 0
    @Published var totalDistance: Double = 0
    @Published var searchResults: [MKMapItem] = []
    @Published var isSearching = false
    @Published var errorMessage: String?

    private let locationService: LocationService
    private let mapService: MapService
    private let hapticService: HapticService
    private let audioService: AudioService
    private let reminderService: ReminderService
    private var reminderTimer: Timer?
    private var cancellables = Set<AnyCancellable>()

    init(locationService: LocationService, mapService: MapService, hapticService: HapticService = .shared, audioService: AudioService, reminderService: ReminderService) {
        self.locationService = locationService
        self.mapService = mapService
        self.hapticService = hapticService
        self.audioService = audioService
        self.reminderService = reminderService

        locationService.$location
            .compactMap { $0 }
            .sink { [weak self] location in
                Task { @MainActor in
                    self?.updateDistanceToNextTurn(currentLocation: location)
                }
            }
            .store(in: &cancellables)
    }

    func search(query: String) async {
        isSearching = true
        defer { isSearching = false }
        let region = locationService.location.map { MKCoordinateRegion(center: $0.coordinate, latitudinalMeters: 50000, longitudinalMeters: 50000) }
        searchResults = await mapService.search(query: query, region: region)
    }

    func startNavigation(to coordinate: CLLocationCoordinate2D, name: String, transport: MKDirectionsTransportType = .automobile) async {
        guard let currentLocation = locationService.location else {
            errorMessage = "Current location not available. Please enable location services."
            return
        }

        transportType = transport
        destinationName = name
        destinationCoordinate = coordinate

        guard let calculatedRoute = await mapService.calculateRoute(
            from: currentLocation.coordinate,
            to: coordinate,
            transportType: transport
        ) else {
            errorMessage = "Could not calculate route. Please try again."
            return
        }

        route = calculatedRoute
        steps = mapService.extractSteps(from: calculatedRoute)
        currentStepIndex = 0
        currentStep = steps.first
        totalDistance = calculatedRoute.distance
        eta = calculatedRoute.expectedTravelTime
        isNavigating = true
        errorMessage = nil

        startReminderLoop()
    }

    func stopNavigation() {
        isNavigating = false
        route = nil
        steps = []
        currentStep = nil
        currentStepIndex = 0
        destinationName = ""
        destinationCoordinate = nil
        reminderTimer?.invalidate()
        reminderTimer = nil
        reminderService.cancelAllReminders()
        audioService.stopSpeaking()
    }

    private func updateDistanceToNextTurn(currentLocation: CLLocation) {
        guard isNavigating, currentStepIndex < steps.count else { return }

        let stepCoordinate = steps[currentStepIndex].coordinate
        let stepLocation = CLLocation(latitude: stepCoordinate.latitude, longitude: stepCoordinate.longitude)
        distanceToNextTurn = currentLocation.distance(from: stepLocation)

        if distanceToNextTurn < 20 && currentStepIndex < steps.count - 1 {
            advanceToNextStep()
        }
    }

    private func advanceToNextStep() {
        currentStepIndex += 1
        if currentStepIndex < steps.count {
            currentStep = steps[currentStepIndex]
            triggerStepReminder()
        } else {
            hapticService.playArrival()
            audioService.speak("You have arrived at your destination.")
            stopNavigation()
        }
    }

    private func triggerStepReminder() {
        guard let step = currentStep else { return }
        hapticService.prepare()

        switch step.maneuverType {
        case .left, .slightLeft, .sharpLeft:
            hapticService.playTurnLeft()
        case .right, .slightRight, .sharpRight:
            hapticService.playTurnRight()
        case .arrive:
            hapticService.playArrival()
        default:
            break
        }

        if audioService.volume > 0 {
            audioService.speak(step.instruction)
        }
    }

    private func startReminderLoop() {
        let settings = UserDefaultsManager.shared.reminderSettings
        guard settings.frequencySeconds > 0 else { return }

        reminderTimer = Timer.scheduledTimer(withTimeInterval: settings.frequencySeconds, repeats: true) { [weak self] _ in
            Task { @MainActor in
                guard let self = self, self.isNavigating else { return }
                self.triggerStepReminder()
            }
        }
    }
}
