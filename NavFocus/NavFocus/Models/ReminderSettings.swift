import Foundation

struct ReminderSettings: Codable {
    var frequencySeconds: Double
    var volume: Float
    var hapticEnabled: Bool
    var voiceEnabled: Bool
    var transitAlertStops: Int

    static let `default` = ReminderSettings(
        frequencySeconds: 30,
        volume: 0.8,
        hapticEnabled: true,
        voiceEnabled: true,
        transitAlertStops: 3
    )
}
