import SwiftUI
import MapKit

enum TransportMode: String, CaseIterable, Hashable {
    case automobile = "Drive"
    case walking = "Walk"
    case transit = "Transit"

    var icon: String {
        switch self {
        case .automobile: return "car"
        case .walking: return "figure.walk"
        case .transit: return "bus"
        }
    }

    var mkTransportType: MKDirectionsTransportType {
        switch self {
        case .automobile: return .automobile
        case .walking: return .walking
        case .transit: return .transit
        }
    }
}

struct RouteSearchView: View {
    @ObservedObject var viewModel: NavigationViewModel
    @ObservedObject var locationService: LocationService
    @State private var searchText = ""
    @State private var transportMode: TransportMode = .automobile

    var body: some View {
        VStack(spacing: 0) {
            searchField
            transportTypePicker
            if viewModel.isSearching {
                ProgressView()
                    .padding()
            } else if viewModel.searchResults.isEmpty && !searchText.isEmpty {
                emptyState
            } else {
                searchResultsList
            }
        }
        .navigationTitle("Navigate")
    }

    private var searchField: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)
            TextField("Search destination", text: $searchText)
                .textFieldStyle(.plain)
                .onSubmit {
                    Task { await viewModel.search(query: searchText) }
                }
            if !searchText.isEmpty {
                Button(action: { searchText = ""; viewModel.searchResults = [] }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(12)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
        .padding(.top, 8)
    }

    private var transportTypePicker: some View {
        Picker("Transport", selection: $transportMode) {
            ForEach(TransportMode.allCases, id: \.self) { mode in
                Label(mode.rawValue, systemImage: mode.icon).tag(mode)
            }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)
        .padding(.top, 8)
    }

    private var emptyState: some View {
        VStack(spacing: 12) {
            Image(systemName: "mappin.slash")
                .font(.system(size: 40))
                .foregroundStyle(.secondary)
            Text("No results found")
                .font(.headline)
                .foregroundStyle(.secondary)
        }
        .padding(.top, 60)
    }

    private var searchResultsList: some View {
        List(viewModel.searchResults, id: \.self) { item in
            Button(action: { startNavigation(to: item) }) {
                HStack {
                    Image(systemName: "mappin.circle.fill")
                        .foregroundStyle(.red)
                    VStack(alignment: .leading) {
                        Text(item.name ?? "Unknown")
                            .font(.headline)
                        Text(item.placemark.title ?? "")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .lineLimit(1)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.secondary)
                }
            }
        }
        .listStyle(.plain)
    }

    private func startNavigation(to item: MKMapItem) {
        guard let coordinate = item.placemark.location?.coordinate else { return }
        Task {
            await viewModel.startNavigation(
                to: coordinate,
                name: item.name ?? "Destination",
                transport: transportMode.mkTransportType
            )
        }
    }
}
