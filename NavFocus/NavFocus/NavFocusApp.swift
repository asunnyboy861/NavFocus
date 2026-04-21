import SwiftUI

@main
struct NavFocusApp: App {
    @StateObject private var locationService = LocationService()
    @StateObject private var mapService = MapService()
    @StateObject private var audioService = AudioService()
    @StateObject private var reminderService = ReminderService()
    @StateObject private var navigationViewModel: NavigationViewModel
    @StateObject private var compassViewModel: CompassViewModel
    @StateObject private var settingsViewModel = SettingsViewModel()

    init() {
        let ls = LocationService()
        let ms = MapService()
        let hs = HapticService.shared
        let as_ = AudioService()
        let rs = ReminderService()

        _locationService = StateObject(wrappedValue: ls)
        _mapService = StateObject(wrappedValue: ms)
        _audioService = StateObject(wrappedValue: as_)
        _reminderService = StateObject(wrappedValue: rs)

        _navigationViewModel = StateObject(wrappedValue: NavigationViewModel(
            locationService: ls,
            mapService: ms,
            hapticService: hs,
            audioService: as_,
            reminderService: rs
        ))
        _compassViewModel = StateObject(wrappedValue: CompassViewModel(locationService: ls))
    }

    var body: some Scene {
        WindowGroup {
            ContentView(
                locationService: locationService,
                navigationViewModel: navigationViewModel,
                compassViewModel: compassViewModel,
                settingsViewModel: settingsViewModel
            )
            .onAppear {
                locationService.requestAuthorization()
                Task {
                    _ = await reminderService.requestAuthorization()
                }
            }
        }
    }
}
