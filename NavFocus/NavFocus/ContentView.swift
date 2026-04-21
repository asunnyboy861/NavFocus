import SwiftUI

struct ContentView: View {
    @ObservedObject var locationService: LocationService
    @ObservedObject var navigationViewModel: NavigationViewModel
    @ObservedObject var compassViewModel: CompassViewModel
    @ObservedObject var settingsViewModel: SettingsViewModel
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                MapView(viewModel: navigationViewModel, locationService: locationService)
            }
            .tabItem {
                Label("Navigate", systemImage: "map.fill")
            }
            .tag(0)

            NavigationStack {
                RouteSearchView(viewModel: navigationViewModel, locationService: locationService)
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
            .tag(1)

            NavigationStack {
                CompassView(
                    compassViewModel: compassViewModel,
                    navigationViewModel: navigationViewModel,
                    locationService: locationService
                )
            }
            .tabItem {
                Label("Compass", systemImage: "location.north.fill")
            }
            .tag(2)

            NavigationStack {
                TransitAlertView(
                    navigationViewModel: navigationViewModel,
                    settingsViewModel: settingsViewModel
                )
            }
            .tabItem {
                Label("Transit", systemImage: "bus.fill")
            }
            .tag(3)

            NavigationStack {
                SettingsView(viewModel: settingsViewModel)
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape.fill")
            }
            .tag(4)
        }
        .onChange(of: selectedTab) { _, newValue in
            if newValue == 2 {
                compassViewModel.updateWithNavigationStep(
                    navigationViewModel.currentStep,
                    currentLocation: locationService.location
                )
            }
        }
    }
}
