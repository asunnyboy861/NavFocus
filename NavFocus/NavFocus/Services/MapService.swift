import Foundation
import MapKit

@MainActor
class MapService: ObservableObject {
    @Published var searchResults: [MKMapItem] = []
    @Published var isSearching = false

    func search(query: String, region: MKCoordinateRegion? = nil) async -> [MKMapItem] {
        isSearching = true
        defer { isSearching = false }

        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        if let region { request.region = region }

        do {
            let search = MKLocalSearch(request: request)
            let response = try await search.start()
            searchResults = response.mapItems
            return response.mapItems
        } catch {
            searchResults = []
            return []
        }
    }

    func calculateRoute(from origin: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D, transportType: MKDirectionsTransportType = .automobile) async -> MKRoute? {
        let originPlacemark = MKPlacemark(coordinate: origin)
        let destinationPlacemark = MKPlacemark(coordinate: destination)

        let originItem = MKMapItem(placemark: originPlacemark)
        let destinationItem = MKMapItem(placemark: destinationPlacemark)

        let request = MKDirections.Request()
        request.source = originItem
        request.destination = destinationItem
        request.transportType = transportType

        do {
            let directions = MKDirections(request: request)
            let response = try await directions.calculate()
            return response.routes.first
        } catch {
            return nil
        }
    }

    func extractSteps(from route: MKRoute) -> [NavigationStep] {
        route.steps.compactMap { step in
            guard step.instructions.isEmpty == false else { return nil }
            let maneuverType = Self.mapManeuverType(step)
            return NavigationStep(
                instruction: step.instructions,
                distance: step.distance,
                maneuverType: maneuverType,
                streetName: nil,
                coordinate: step.polyline.coordinate
            )
        }
    }

    private static func mapManeuverType(_ step: MKRoute.Step) -> ManeuverType {
        let instructions = step.instructions.lowercased()
        if instructions.contains("u-turn") { return .uTurn }
        if instructions.contains("sharp left") { return .sharpLeft }
        if instructions.contains("sharp right") { return .sharpRight }
        if instructions.contains("slight left") { return .slightLeft }
        if instructions.contains("slight right") { return .slightRight }
        if instructions.contains("left") { return .left }
        if instructions.contains("right") { return .right }
        if instructions.contains("arrive") || instructions.contains("destination") { return .arrive }
        return .straight
    }
}
