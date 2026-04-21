import Foundation
import CoreLocation

struct TransitStop: Identifiable, Codable {
    let id: UUID
    var name: String
    var latitude: Double
    var longitude: Double
    var order: Int
    var isDestination: Bool

    init(id: UUID = UUID(), name: String, latitude: Double, longitude: Double, order: Int, isDestination: Bool = false) {
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.order = order
        self.isDestination = isDestination
    }

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
