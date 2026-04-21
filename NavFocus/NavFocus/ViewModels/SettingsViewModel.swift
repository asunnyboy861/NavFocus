import Foundation
import Combine

@MainActor
class SettingsViewModel: ObservableObject {
    @Published var reminderFrequency: Double {
        didSet { saveSettings() }
    }
    @Published var reminderVolume: Float {
        didSet { saveSettings() }
    }
    @Published var hapticEnabled: Bool {
        didSet { saveSettings() }
    }
    @Published var voiceEnabled: Bool {
        didSet { saveSettings() }
    }
    @Published var transitAlertStops: Int {
        didSet { saveSettings() }
    }

    private let defaults = UserDefaultsManager.shared

    init() {
        let settings = defaults.reminderSettings
        reminderFrequency = settings.frequencySeconds
        reminderVolume = settings.volume
        hapticEnabled = settings.hapticEnabled
        voiceEnabled = settings.voiceEnabled
        transitAlertStops = settings.transitAlertStops
    }

    private func saveSettings() {
        let settings = ReminderSettings(
            frequencySeconds: reminderFrequency,
            volume: reminderVolume,
            hapticEnabled: hapticEnabled,
            voiceEnabled: voiceEnabled,
            transitAlertStops: transitAlertStops
        )
        defaults.reminderSettings = settings
    }

    func resetToDefaults() {
        let defaults = ReminderSettings.default
        reminderFrequency = defaults.frequencySeconds
        reminderVolume = defaults.volume
        hapticEnabled = defaults.hapticEnabled
        voiceEnabled = defaults.voiceEnabled
        transitAlertStops = defaults.transitAlertStops
    }
}
