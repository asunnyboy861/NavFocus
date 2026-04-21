import Foundation
import Combine
import CoreLocation

@MainActor
class CompassViewModel: ObservableObject {
    @Published var heading: Double = 0
    @Published var directionToNextTurn: Double = 0
    @Published var distanceToNextTurn: Double = 0
    @Published var nextTurnInstruction: String = ""
    @Published var compassDirection: String = "N"

    private let locationService: LocationService
    private var cancellables = Set<AnyCancellable>()

    init(locationService: LocationService) {
        self.locationService = locationService

        locationService.$heading
            .compactMap { $0 }
            .sink { [weak self] newHeading in
                Task { @MainActor in
                    self?.heading = newHeading.trueHeading
                    self?.updateCompassDirection()
                }
            }
            .store(in: &cancellables)
    }

    func updateWithNavigationStep(_ step: NavigationStep?, currentLocation: CLLocation?) {
        guard let step = step, let currentLocation = currentLocation else {
            nextTurnInstruction = ""
            distanceToNextTurn = 0
            directionToNextTurn = 0
            return
        }

        nextTurnInstruction = step.instruction
        let stepLocation = CLLocation(latitude: step.coordinate.latitude, longitude: step.coordinate.longitude)
        distanceToNextTurn = currentLocation.distance(from: stepLocation)
        directionToNextTurn = GeometryUtils.bearing(from: currentLocation.coordinate, to: step.coordinate)
    }

    private func updateCompassDirection() {
        let directions = ["N", "NE", "E", "SE", "S", "SW", "W", "NW"]
        let index = Int((heading + 22.5) / 45.0) % 8
        compassDirection = directions[index]
    }
}
