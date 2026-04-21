import Foundation

@MainActor
class UserDefaultsManager {
    static let shared = UserDefaultsManager()

    private let defaults = UserDefaults.standard

    private enum Keys {
        static let reminderSettings = "reminderSettings"
        static let favorites = "favorites"
        static let hasCompletedOnboarding = "hasCompletedOnboarding"
    }

    var reminderSettings: ReminderSettings {
        get {
            guard let data = defaults.data(forKey: Keys.reminderSettings),
                  let settings = try? JSONDecoder().decode(ReminderSettings.self, from: data) else {
                return .default
            }
            return settings
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                defaults.set(data, forKey: Keys.reminderSettings)
            }
        }
    }

    var favorites: [FavoriteLocation] {
        get {
            guard let data = defaults.data(forKey: Keys.favorites),
                  let locations = try? JSONDecoder().decode([FavoriteLocation].self, from: data) else {
                return []
            }
            return locations
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                defaults.set(data, forKey: Keys.favorites)
            }
        }
    }

    var hasCompletedOnboarding: Bool {
        get { defaults.bool(forKey: Keys.hasCompletedOnboarding) }
        set { defaults.set(newValue, forKey: Keys.hasCompletedOnboarding) }
    }
}
