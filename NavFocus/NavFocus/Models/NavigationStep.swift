import Foundation
import CoreLocation

enum ManeuverType: String, Codable {
    case straight = "straight"
    case left = "left"
    case right = "right"
    case slightLeft = "slightLeft"
    case slightRight = "slightRight"
    case sharpLeft = "sharpLeft"
    case sharpRight = "sharpRight"
    case uTurn = "uTurn"
    case arrive = "arrive"
}

struct NavigationStep: Identifiable, Codable {
    let id: UUID
    let instruction: String
    let distance: Double
    let maneuverType: ManeuverType
    let streetName: String?
    let coordinate: CLLocationCoordinate2D

    init(id: UUID = UUID(), instruction: String, distance: Double, maneuverType: ManeuverType, streetName: String? = nil, coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()) {
        self.id = id
        self.instruction = instruction
        self.distance = distance
        self.maneuverType = maneuverType
        self.streetName = streetName
        self.coordinate = coordinate
    }

    enum CodingKeys: String, CodingKey {
        case id, instruction, distance, maneuverType, streetName, latitude, longitude
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        instruction = try container.decode(String.self, forKey: .instruction)
        distance = try container.decode(Double.self, forKey: .distance)
        maneuverType = try container.decode(ManeuverType.self, forKey: .maneuverType)
        streetName = try container.decodeIfPresent(String.self, forKey: .streetName)
        let lat = try container.decode(Double.self, forKey: .latitude)
        let lon = try container.decode(Double.self, forKey: .longitude)
        coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(instruction, forKey: .instruction)
        try container.encode(distance, forKey: .distance)
        try container.encode(maneuverType, forKey: .maneuverType)
        try container.encodeIfPresent(streetName, forKey: .streetName)
        try container.encode(coordinate.latitude, forKey: .latitude)
        try container.encode(coordinate.longitude, forKey: .longitude)
    }
}
