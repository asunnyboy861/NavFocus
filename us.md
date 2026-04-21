# NavFocus - ADHD Navigation & Focus Drive Helper

**English Operation Guide for iOS Development**

> **App Name**: NavFocus  
> **Subtitle**: ADHD Navigation & Focus Drive Helper  
> **App Store Title**: NavFocus - ADHD Navigation & Focus Drive Helper  
> **Bundle ID**: com.zzoutuo.NavFocus  
> **Minimum iOS Version**: 17.0  
> **Target Market**: United States  
> **Primary Language**: English  

---

## Table of Contents

1. [Executive Summary](#executive-summary)
2. [Competitive Analysis](#competitive-analysis)
3. [Apple Design Guidelines Compliance](#apple-design-guidelines-compliance)
4. [Technical Architecture](#technical-architecture)
5. [Module Structure & File Organization](#module-structure--file-organization)
6. [Implementation Flow](#implementation-flow)
7. [UI/UX Design Specifications](#uiux-design-specifications)
8. [Code Generation Rules](#code-generation-rules)
9. [Testing & Validation Standards](#testing--validation-standards)
10. [Build & Deployment Checklist](#build--deployment-checklist)

---

## Executive Summary

### Product Vision

**NavFocus** is the first navigation app specifically designed for adults with ADHD (Attention Deficit Hyperactivity Disorder). It addresses the critical pain points that ADHD users experience with traditional navigation apps: missing turns, overshooting transit stops, and experiencing travel anxiety due to time blindness.

### Core Value Proposition

**"NavFocus keeps ADHD drivers focused on every turn."**

Unlike Google Maps, Apple Maps, or Waze—which provide turn-by-turn guidance only once at each turn—NavFocus provides **customizable, high-frequency reminders** that accommodate ADHD users' unique cognitive patterns:

- **Time Blindness**: ADHD users lose track of time and distance while traveling
- **Attention Shifting**: Hearing one instruction isn't enough; attention drifts within seconds
- **Working Memory Deficit**: Even when heard, instructions are quickly forgotten
- **Hyperfocus**: Users immersed in music, podcasts, or thoughts miss navigation cues
- **Anxiety Loop**: Fear of missing turns creates stress that further impairs focus
- **Transit Overshooting**: Public transit users miss stops due to single-notification systems

### Key Differentiators

| Feature | Google Maps | Apple Maps | Waze | NavFocus |
|---------|-------------|------------|------|----------|
| Turn Reminder Frequency | Once per turn | Once per turn | Once per turn | **Customizable (15s, 30s, 1min intervals)** |
| Transit Stop Alerts | Once at arrival | Once at arrival | N/A | **Progressive alerts (N stops before)** |
| Haptic Feedback | Voice only | Voice only | Voice only | **Voice + Haptic dual-channel** |
| Apple Watch Integration | Basic | Basic | Basic | **Wrist-specific haptic patterns** |
| Compass Direction | No | No | No | **Real-time magnetic compass** |
| ADHD-Optimized Mode | No | No | No | **Core design philosophy** |
| Independent Reminder Volume | System volume | System volume | System volume | **Separate volume control** |
| Distraction Detection | No | No | No | **Phase 2: AI-powered detection** |

### Target Market

- **Primary Market**: United States
- **Target Users**: 
  - 15M+ adults diagnosed with ADHD in the US
  - 30M+ individuals experiencing time blindness
  - 5M+ reachable users (iPhone owners with ADHD)
- **Total Addressable Market (TAM)**: $25M/year (5M users × $4.99 one-time purchase or subscription equivalent)

### Revenue Model

**Phase 1 (MVP)**:
- One-time purchase: $4.99
- OR Freemium with Pro subscription: $2.99/month, $19.99/year

**Phase 2 (Enhanced)**:
- Add AI-powered distraction detection
- Add HealthKit integration for stress monitoring
- Premium tier: $4.99/month, $29.99/year

---

## Competitive Analysis

### Direct Competitors: ADHD-Focused Apps

| App Name | Category | Key Features | Limitations | NavFocus Advantage |
|----------|----------|--------------|-------------|-------------------|
| **Brimming ADHD** | Health & Fitness | AI guidance, task management, time blindness support | No navigation features; task-focused only | NavFocus provides real-time navigation with ADHD-optimized reminders |
| **ADHD Easy-Do** | Health & Fitness | Planner, AI assistant, focus timer, Pomodoro technique | No navigation; productivity tool only | NavFocus addresses travel-specific ADHD challenges |
| **ADHD Guide** | Health & Fitness | Articles, self-tests, breathing exercises, Pomodoro timer | Educational content only; no navigation | NavFocus is a practical navigation solution |
| **InControl** | Productivity | ADHD planner, focus timer, body double mode, insights dashboard | No navigation; task management focus | NavFocus fills the navigation gap in ADHD tools |

### Indirect Competitors: Navigation Apps

| App Name | Rating | Strengths | Weaknesses | NavFocus Advantage |
|----------|--------|-----------|------------|-------------------|
| **Google Maps** | 4.5/5 | Best POI database, real-time traffic, extensive coverage | Single turn reminders, no ADHD features, no haptic customization | Customizable reminder frequency, ADHD-specific design |
| **Apple Maps** | 4.3/5 | Privacy-focused, Siri integration, Apple ecosystem | Limited customization, single alerts, no ADHD mode | Independent volume control, haptic feedback, ADHD optimization |
| **Waze** | 4.6/5 | Community reports, real-time alerts, speed cameras | Driving-focused only, no transit/walking modes, no ADHD features | Multi-mode support (drive/walk/transit), ADHD core design |
| **Transit** | 4.4/5 | Public transit focus, real-time arrivals | Single stop notification, no ADHD mode | Progressive stop alerts (N stops before arrival) |
| **Citymapper** | 4.5/5 | Multi-modal transit, comprehensive city coverage | No ADHD-specific features, no haptic customization | ADHD-optimized reminder system |

### Competitive Positioning

**NavFocus occupies a unique blue ocean market position:**

1. **No direct competitor** combines ADHD-specific features with navigation
2. **"ADHD Navigation"** is a low-competition keyword combination in App Store search
3. **Underserved market**: 15M+ diagnosed ADHD adults in the US, most using generic navigation apps
4. **First-mover advantage**: Be the first to market with ADHD-optimized navigation

### Market Opportunity Validation

**Reddit User Quotes (Real Pain Points):**

> "A navigation app for people with ADHD. I want **very frequent reminders** about how far I am from my next turn when biking, walking or driving, what the street name. When I am on a bus or train, I want **several reminders to get off soon**. I want to configure how often the reminders are, and how loud they are." — r/SomebodyMakeThis

> "I've missed my stop on the bus **so many times** because I was zoning out. Google Maps just gives one notification and I miss it every time." — r/ADHD

> "POV: you have ADHD and miss every single turn even with GPS on 😭" — TikTok Comment

---

## Apple Design Guidelines Compliance

### Human Interface Guidelines (HIG) Adherence

#### 1. **Clarity**

- **Text is legible at every size**: Use Dynamic Type for all text; minimum 17pt for body text
- **Icons are precise and lucid**: Use SF Symbols for all navigation icons
- **Adornments are subtle and appropriate**: Minimal UI chrome; focus on map and essential controls
- **Negative space elevates content**: Generous padding around map elements and controls

#### 2. **Deference**

- **Fluid motion and crisp interface**: Smooth map transitions; 60fps animations
- **Content fills the screen**: Map view occupies full screen with floating controls
- **Minimal borders, gradients, and shadows**: Use translucent materials for overlays
- **Subtle animations for state changes**: Fade in/out for reminder popups

#### 3. **Depth**

- **Visual layers and realistic motion**: Floating control panels with blur effects
- **Contextual feedback**: Haptic feedback for turn reminders
- **Discoverable content**: Swipe gestures to reveal settings

#### 4. **Consistency**

- **Standard controls**: Use standard SwiftUI components (TabView, NavigationStack)
- **Predictable behavior**: Back gesture, pull-to-refresh, standard navigation patterns
- **Familiar icons**: Use SF Symbols that users recognize

#### 5. **Direct Manipulation**

- **Direct interaction with content**: Pinch to zoom, drag to pan, tap to select
- **Immediate results**: Real-time compass updates, instant reminder triggers
- **Gesture-based navigation**: Swipe to dismiss, tap to confirm

#### 6. **Feedback**

- **Haptic feedback**: Wrist taps for turn directions (Apple Watch)
- **Audio feedback**: Voice prompts with independent volume control
- **Visual feedback**: Progress indicators, distance countdowns

#### 7. **Metaphors**

- **Familiar metaphors**: Compass points north; distance counts down
- **Spatial relationships**: Map shows current location relative to destination

#### 8. **User Control**

- **Customizable reminders**: Users choose frequency (15s, 30s, 1min, custom)
- **Volume control**: Independent reminder volume slider
- **Transit alerts**: Users set how many stops before arrival to receive alerts

### iOS 17 Specific Guidelines

#### MapKit for SwiftUI

- Use `Map` view with `MapCameraPosition` for camera control
- Use `MapPolyline` for route visualization
- Use `Marker` and `Annotation` for POI markers
- Use `MapStyle` to customize map appearance (standard, satellite, hybrid)

#### NavigationStack

- Replace `NavigationView` with `NavigationStack` for modern navigation
- Use `NavigationLink` for push navigation
- Use `navigationDestination` for type-safe navigation

#### TabView

- Use `TabView` for main app navigation (Map, Settings, History)
- Keep 3-5 tabs maximum per HIG recommendations
- Ensure tabs remain visible even when content is unavailable

### Accessibility Guidelines

#### VoiceOver Support

- All interactive elements have descriptive accessibility labels
- Map elements announce their purpose ("Your current location", "Next turn: Right on Main Street")
- Reminder controls announce their state ("Turn reminders enabled, frequency 30 seconds")

#### Dynamic Type

- Support all text scaling sizes (xSmall to xxxLarge)
- Use scalable fonts: `.font(.body)`, `.font(.headline)`, etc.
- Test with accessibility sizes enabled

#### Color and Contrast

- Minimum 4.5:1 contrast ratio for text
- Don't rely on color alone to convey information
- Use shapes and icons alongside color for turn directions

#### Reduce Motion

- Respect `UIAccessibility.isReduceMotionEnabled`
- Provide alternative animations for users with motion sensitivity

### App Store Review Guidelines Compliance

#### 1. **Safety (Guideline 1)**

- **No objectionable content**: App provides navigation only
- **No user-generated content**: No risk of inappropriate content
- **Age rating**: 4+ (suitable for all ages)

#### 2. **Performance (Guideline 2)**

- **App completeness**: All features fully functional
- **Beta testing**: TestFlight beta before App Store submission
- **Accurate metadata**: Screenshots, description, keywords match app features

#### 3. **Business (Guideline 3)**

- **Payment methods**: Use Apple IAP for subscriptions (if applicable)
- **Subscription terms**: Display renewal terms, cancellation instructions, free trial forfeit clause
- **No hidden costs**: Clear pricing in app and App Store description

#### 4. **Design (Guideline 4)**

- **Minimum functionality**: App provides full navigation features
- **No placeholder content**: All UI elements functional
- **Follow HIG**: Comply with all Human Interface Guidelines

#### 5. **Legal (Guideline 5)**

- **Privacy policy**: Required; hosted on GitHub Pages
- **Data collection**: Location data used for navigation only; no third-party sharing
- **Location services**: Explain why location is needed; app is non-functional without it (justified for navigation app)

### Location Services Guidelines

**Critical**: Navigation apps require location services to function. Per App Store Review Guidelines 5.1.1:

- **Explain location usage**: Onboarding screen explains why location is needed
- **Request permission**: Use `CLLocationManager` to request `whenInUse` authorization
- **Handle denial**: Show explanatory alert if user denies location permission
- **Privacy**: Location data stays on device; no server transmission

---

## Technical Architecture

### System Architecture Overview

```
┌─────────────────────────────────────────────────────────────────────────┐
│                         NavFocus System Architecture                     │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │                     UI Layer (SwiftUI)                          │   │
│  │  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────────┐   │   │
│  │  │ MapView  │  │ Reminder │  │ Compass  │  │ Settings     │   │   │
│  │  │          │  │ Control  │  │ View     │  │ View         │   │   │
│  │  └────┬─────┘  └────┬─────┘  └────┬─────┘  └──────┬───────┘   │   │
│  └───────┼──────────────┼──────────────┼───────────────┼───────────┘   │
│          │              │              │               │               │
│  ┌───────┴──────────────┴──────────────┴───────────────┴───────────┐   │
│  │                    ViewModel Layer (MVVM)                        │   │
│  │  ┌──────────────┐  ┌───────────────┐  ┌────────────────────┐   │   │
│  │  │NavigationVM  │  │ ReminderVM    │  │ CompassVM          │   │   │
│  │  │ - route      │  │ - intervals   │  │ - heading          │   │   │
│  │  │ - steps      │  │ - triggers    │  │ - direction        │   │   │
│  │  │ - progress   │  │ - haptics     │  │ - nextTurnAngle    │   │   │
│  │  └──────┬───────┘  └───────┬───────┘  └─────────┬──────────┘   │   │
│  └─────────┼──────────────────┼─────────────────────┼──────────────┘   │
│            │                  │                     │                   │
│  ┌─────────┴──────────────────┴─────────────────────┴──────────────┐   │
│  │                    Service Layer                                 │   │
│  │  ┌────────────┐  ┌──────────────┐  ┌──────────┐  ┌──────────┐ │   │
│  │  │ MapKit     │  │ CoreLocation │  │ Haptic   │  │ Watch    │ │   │
│  │  │ Service    │  │ Service      │  │ Service  │  │ Service  │ │   │
│  │  │ - Route    │  │ - GPS        │  │ - Taptic │  │ - Sync   │ │   │
│  │  │ - Direction│  │ - Heading    │  │ - Watch  │  │ - Notify │ │   │
│  │  │ - ETA      │  │ - Region     │  │ - Audio  │  │ - Comp   │ │   │
│  │  └────────────┘  └──────────────┘  └──────────┘  └──────────┘ │   │
│  └──────────────────────────────────────────────────────────────────┘   │
│                                                                         │
│  ┌──────────────────────────────────────────────────────────────────┐   │
│  │                    Data Layer                                     │   │
│  │  ┌────────────┐  ┌──────────────┐  ┌──────────────────────────┐ │   │
│  │  │ Core Data  │  │ UserDefaults │  │ HealthKit (Phase 2)      │ │   │
│  │  │ - Routes   │  │ - Reminder   │  │ - Heart Rate             │ │   │
│  │  │ - History  │  │   Settings   │  │ - Stress Indicators      │ │   │
│  │  │ - Favorites│  │ - Sound      │  │ - Driving Patterns       │ │   │
│  │  └────────────┘  └──────────────┘  └──────────────────────────┘ │   │
│  └──────────────────────────────────────────────────────────────────┘   │
│                                                                         │
│  ┌──────────────────────────────────────────────────────────────────┐   │
│  │                    watchOS Extension                              │   │
│  │  ┌────────────┐  ┌──────────────┐  ┌──────────────────────────┐ │   │
│  │  │ Watch App  │  │ Complication │  │ Background               │ │   │
│  │  │ - Haptic   │  │ - Next Turn │  │ - Location Monitor       │ │   │
│  │  │ - Direction│  │ - ETA       │  │ - Haptic Triggers        │ │   │
│  │  └────────────┘  └──────────────┘  └──────────────────────────┘ │   │
│  └──────────────────────────────────────────────────────────────────┘   │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

### Technology Stack

| Technology | Version | Purpose | Framework/API |
|------------|---------|---------|---------------|
| **Swift** | 5.9+ | Primary development language | - |
| **SwiftUI** | iOS 17+ | UI framework | `Map`, `MapCameraPosition`, `NavigationStack`, `TabView` |
| **MapKit** | iOS 17+ | Maps and navigation | `MKDirections`, `MKRoute`, `MKRouteStep`, `MKMapItem` |
| **CoreLocation** | iOS 17+ | Location services | `CLLocationManager`, `CLHeading`, `CLRegion` |
| **UserNotifications** | iOS 17+ | Local notifications | `UNNotificationRequest`, `UNUserNotificationCenter` |
| **CoreData** | iOS 17+ | Data persistence | `NSPersistentContainer`, `NSManagedObject` |
| **WatchConnectivity** | watchOS 10+ | iPhone-Watch communication | `WCSession`, `WKWatchConnectivityRefreshBackgroundTask` |
| **AVFoundation** | iOS 17+ | Audio playback | `AVSpeechSynthesizer`, `AVAudioSession` |
| **HealthKit** | iOS 17+ | Health data (Phase 2) | `HKHealthStore`, `HKQuantityType` |

### Core Frameworks

#### 1. MapKit (iOS 17+)

**Purpose**: Provides mapping, routing, and navigation capabilities.

**Key APIs**:
- `MKDirections`: Calculate routes between locations
- `MKRoute`: Contains route steps and polylines
- `MKRouteStep`: Individual navigation steps
- `MKMapItem`: Represents a location on the map
- `MKLocalSearch`: Search for locations by name/address

**SwiftUI Integration**:
```swift
import MapKit

@State private var cameraPosition: MapCameraPosition = .region(.init())
@State private var route: MKRoute?

var body: some View {
    Map(position: $cameraPosition) {
        UserAnnotation()
        if let route {
            MapPolyline(route.polyline)
                .stroke(.blue, lineWidth: 5)
        }
    }
}
```

#### 2. CoreLocation (iOS 17+)

**Purpose**: Provides GPS location and compass heading.

**Key APIs**:
- `CLLocationManager`: Manage location updates
- `CLHeading`: Compass heading data
- `CLRegion`: Geographic regions for monitoring
- `CLLocation`: Represents a geographic coordinate

**Implementation**:
```swift
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation?
    @Published var heading: CLHeading?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
    }
}
```

#### 3. UserNotifications (iOS 17+)

**Purpose**: Schedule and deliver local notifications for reminders.

**Key APIs**:
- `UNUserNotificationCenter`: Manage notifications
- `UNNotificationRequest`: Schedule a notification
- `UNMutableNotificationContent`: Notification content
- `UNTimeIntervalNotificationTrigger`: Time-based trigger

**Implementation**:
```swift
import UserNotifications

func scheduleReminder(title: String, body: String, in seconds: TimeInterval) {
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = .default
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request)
}
```

#### 4. CoreData (iOS 17+)

**Purpose**: Persist route history, favorites, and settings.

**Key Entities**:
- `Route`: Saved route with origin, destination, waypoints
- `RouteHistory`: Past navigation sessions with timestamps
- `FavoriteLocation`: User's saved locations (home, work, etc.)
- `ReminderSettings`: User's reminder preferences

**Implementation**:
```swift
import CoreData

@MainActor
class PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "NavFocus")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("CoreData failed to load: \(error.localizedDescription)")
            }
        }
    }
}
```

#### 5. WatchConnectivity (watchOS 10+)

**Purpose**: Sync navigation data between iPhone and Apple Watch.

**Key APIs**:
- `WCSession`: Communication session
- `WCSessionDelegate`: Handle incoming messages
- `sendMessage(_:replyHandler:errorHandler:)`: Send data to counterpart

**Implementation**:
```swift
import WatchConnectivity

class WatchSessionManager: NSObject, ObservableObject, WCSessionDelegate {
    private let session = WCSession.default
    @Published var receivedData: [String: Any] = [:]
    
    override init() {
        super.init()
        session.delegate = self
        session.activate()
    }
    
    func sendToWatch(data: [String: Any]) {
        if session.isReachable {
            session.sendMessage(data, replyHandler: nil)
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            self.receivedData = message
        }
    }
}
```

### Design Patterns

#### MVVM (Model-View-ViewModel)

**Purpose**: Separate UI from business logic for testability and maintainability.

**Structure**:
- **Model**: Data entities (Route, Location, ReminderSettings)
- **View**: SwiftUI views (MapView, SettingsView, CompassView)
- **ViewModel**: Business logic (NavigationViewModel, ReminderViewModel, CompassViewModel)

**Example**:
```swift
// Model
struct NavigationStep: Identifiable {
    let id = UUID()
    let instruction: String
    let distance: Double
    let maneuverType: ManeuverType
}

// ViewModel
@MainActor
class NavigationViewModel: ObservableObject {
    @Published var currentStep: NavigationStep?
    @Published var distanceToNextTurn: Double = 0
    @Published var route: MKRoute?
    
    private let locationService: LocationService
    private let reminderService: ReminderService
    
    func startNavigation(to destination: CLLocationCoordinate2D) async {
        // Calculate route
        // Start location updates
        // Schedule reminders
    }
}

// View
struct NavigationView: View {
    @StateObject private var viewModel = NavigationViewModel()
    
    var body: some View {
        VStack {
            MapView(route: viewModel.route)
            TurnInstructionView(step: viewModel.currentStep)
        }
    }
}
```

#### Dependency Injection

**Purpose**: Decouple components for easier testing and flexibility.

**Implementation**:
```swift
protocol LocationServiceProtocol {
    var currentLocation: CLLocation? { get }
    func requestAuthorization()
    func startUpdatingLocation()
}

class LocationService: LocationServiceProtocol {
    // Implementation
}

class NavigationViewModel: ObservableObject {
    private let locationService: LocationServiceProtocol
    
    init(locationService: LocationServiceProtocol = LocationService()) {
        self.locationService = locationService
    }
}
```

#### Observer Pattern

**Purpose**: React to location changes, heading updates, and reminder triggers.

**Implementation**:
```swift
class LocationManager: ObservableObject {
    @Published var location: CLLocation?
    @Published var heading: CLHeading?
    
    // CLLocationManagerDelegate methods update @Published properties
    // SwiftUI views automatically re-render when properties change
}
```

---

## Module Structure & File Organization

### Directory Structure

```
NavFocus/
├── NavFocusApp.swift                 # App entry point
├── ContentView.swift                 # Main tab view
│
├── Models/                           # Data models
│   ├── NavigationStep.swift          # Navigation step model
│   ├── Route.swift                   # Route model
│   ├── FavoriteLocation.swift        # Favorite location model
│   ├── ReminderSettings.swift        # Reminder settings model
│   └── TransitStop.swift             # Transit stop model
│
├── ViewModels/                       # Business logic
│   ├── NavigationViewModel.swift     # Navigation logic
│   ├── ReminderViewModel.swift       # Reminder scheduling logic
│   ├── CompassViewModel.swift        # Compass heading logic
│   ├── TransitViewModel.swift        # Transit tracking logic
│   └── SettingsViewModel.swift       # Settings management
│
├── Views/                            # SwiftUI views
│   ├── Navigation/                   # Navigation-related views
│   │   ├── MapView.swift             # Main map view
│   │   ├── TurnInstructionView.swift # Turn instruction overlay
│   │   ├── RouteSearchView.swift     # Search for destination
│   │   └── NavigationModeView.swift  # Driving/Walking/Transit selector
│   │
│   ├── Compass/                      # Compass-related views
│   │   ├── CompassView.swift         # Compass display
│   │   └── DirectionIndicatorView.swift # Direction arrow
│   │
│   ├── Transit/                      # Transit-related views
│   │   ├── TransitListView.swift     # List of transit stops
│   │   └── StopAlertView.swift       # Stop alert notification
│   │
│   ├── Settings/                     # Settings views
│   │   ├── SettingsView.swift        # Main settings view
│   │   ├── ReminderSettingsView.swift # Reminder configuration
│   │   ├── VolumeSettingsView.swift  # Volume control
│   │   ├── ContactSupportView.swift  # Contact support form
│   │   └── AboutView.swift           # App info and legal links
│   │
│   └── Components/                   # Reusable UI components
│       ├── FloatingPanel.swift       # Floating control panel
│       ├── ProgressRingView.swift    # Circular progress indicator
│       ├── HapticButton.swift        # Button with haptic feedback
│       └── StatusBadgeView.swift     # Status indicator badge
│
├── Services/                         # Business logic services
│   ├── LocationService.swift         # GPS and heading management
│   ├── MapService.swift              # MapKit routing and directions
│   ├── ReminderService.swift         # Reminder scheduling
│   ├── HapticService.swift           # Haptic feedback engine
│   ├── AudioService.swift            # Voice prompts
│   ├── WatchService.swift            # Apple Watch communication
│   └── TransitService.swift          # Transit stop tracking
│
├── Data/                             # Data persistence
│   ├── PersistenceController.swift   # CoreData stack
│   └── UserDefaultsManager.swift     # User preferences
│
├── Extensions/                       # Swift extensions
│   ├── CLLocationCoordinate2D+Extensions.swift
│   ├── CLHeading+Extensions.swift
│   ├── MKRoute+Extensions.swift
│   └── Color+Theme.swift             # Custom colors
│
├── Utilities/                        # Helper utilities
│   ├── Constants.swift               # App-wide constants
│   ├── GeometryUtils.swift           # Distance and angle calculations
│   └── DateUtils.swift               # Time formatting utilities
│
├── Resources/                        # Assets and resources
│   ├── Assets.xcassets/              # Images, colors, app icon
│   │   ├── AppIcon.appiconset/
│   │   ├── AccentColor.colorset/
│   │   └── MapAssets/
│   └── Localizable.strings           # Localized strings (English)
│
└── NavFocus.xcdatamodeld/            # CoreData model
    └── NavFocus.xcdatamodel/
        └── contents                  # Entity definitions
```

### Module Responsibilities

#### 1. Models Module

**Purpose**: Define data structures used throughout the app.

**Files**:
- `NavigationStep.swift`: Represents a single navigation instruction
- `Route.swift`: Represents a complete route with origin, destination, waypoints
- `FavoriteLocation.swift`: User's saved locations (home, work, etc.)
- `ReminderSettings.swift`: User's reminder frequency and volume preferences
- `TransitStop.swift`: Represents a transit stop with alert settings

**Principles**:
- Immutable structs where possible
- `Identifiable` for SwiftUI list rendering
- `Codable` for persistence and Watch connectivity

#### 2. ViewModels Module

**Purpose**: Encapsulate business logic and state management.

**Files**:
- `NavigationViewModel.swift`: Manages route calculation, location updates, turn instructions
- `ReminderViewModel.swift`: Schedules and triggers reminders based on distance/time
- `CompassViewModel.swift`: Processes compass heading and calculates direction to next turn
- `TransitViewModel.swift`: Tracks transit stops and triggers stop alerts
- `SettingsViewModel.swift`: Manages user preferences and settings persistence

**Principles**:
- `@MainActor` for thread safety
- `@Published` properties for SwiftUI reactivity
- Dependency injection for testability
- Single responsibility: each ViewModel manages one feature

#### 3. Views Module

**Purpose**: Render UI and handle user interactions.

**Submodules**:
- `Navigation/`: Map and turn instruction views
- `Compass/`: Compass and direction indicator views
- `Transit/`: Transit stop list and alert views
- `Settings/`: Settings and preference views
- `Components/`: Reusable UI components

**Principles**:
- SwiftUI declarative syntax
- `@StateObject` for ViewModel ownership
- `@ObservedObject` for injected ViewModels
- `@EnvironmentObject` for shared services (LocationService, etc.)

#### 4. Services Module

**Purpose**: Encapsulate framework-specific logic and external integrations.

**Files**:
- `LocationService.swift`: CoreLocation wrapper for GPS and compass
- `MapService.swift`: MapKit wrapper for routing and directions
- `ReminderService.swift`: UserNotifications wrapper for reminder scheduling
- `HapticService.swift`: Haptic feedback engine for turn alerts
- `AudioService.swift`: AVFoundation wrapper for voice prompts
- `WatchService.swift`: WatchConnectivity wrapper for iPhone-Watch sync
- `TransitService.swift`: Transit-specific location monitoring

**Principles**:
- Protocol-oriented design for testability
- Singleton pattern for shared services (optional, use dependency injection when possible)
- Error handling with Swift's `Result` type
- Async/await for asynchronous operations

#### 5. Data Module

**Purpose**: Manage data persistence and user preferences.

**Files**:
- `PersistenceController.swift`: CoreData stack initialization and management
- `UserDefaultsManager.swift`: Type-safe UserDefaults access

**Principles**:
- `NSPersistentContainer` for local storage
- Switch to `NSPersistentCloudKitContainer` for CloudKit sync (Phase 2)
- All CoreData attributes must be optional or have default values
- All relationships must have inverse relationships

#### 6. Extensions Module

**Purpose**: Extend framework types with convenience methods.

**Files**:
- `CLLocationCoordinate2D+Extensions.swift`: Distance calculation, bearing calculation
- `CLHeading+Extensions.swift`: Heading to compass direction conversion
- `MKRoute+Extensions.swift`: Route step extraction, total distance calculation
- `Color+Theme.swift`: Custom app colors (accent, background, etc.)

**Principles**:
- Keep extensions focused and cohesive
- Use extensions to add functionality to framework types
- Avoid extending your own types; use proper methods instead

#### 7. Utilities Module

**Purpose**: Provide helper functions and constants.

**Files**:
- `Constants.swift`: App-wide constants (default reminder intervals, volume levels, etc.)
- `GeometryUtils.swift`: Distance, bearing, and angle calculations
- `DateUtils.swift`: Time formatting utilities

**Principles**:
- Pure functions where possible
- No side effects
- Well-documented with inline comments

---

## Implementation Flow

### Phase 1: Project Setup and Configuration

#### Step 1.1: Verify Xcode Project

**Action**: Verify the existing Xcode project structure.

**Checklist**:
- [ ] Project opens in Xcode without errors
- [ ] Bundle ID is set to `com.zzoutuo.NavFocus`
- [ ] iOS Deployment Target is set to `17.0`
- [ ] Swift Language Version is set to `5.9` or later
- [ ] Project has a valid signing certificate

**Commands**:
```bash
# Discover Xcode project
mcp_XcodeBuildMCP_discover_projs

# List schemes
mcp_XcodeBuildMCP_list_schemes

# Show build settings
mcp_XcodeBuildMCP_show_build_settings
```

#### Step 1.2: Configure Build Settings

**Action**: Set essential build settings for the project.

**Settings**:
- `PRODUCT_BUNDLE_IDENTIFIER`: `com.zzoutuo.NavFocus`
- `IPHONEOS_DEPLOYMENT_TARGET`: `17.0`
- `SWIFT_VERSION`: `5.9`
- `TARGETED_DEVICE_FAMILY`: `1,2` (iPhone + iPad)
- `INFOPLIST_KEY_NSLocationWhenInUseUsageDescription`: "NavFocus needs your location to provide turn-by-turn navigation and reminders."
- `INFOPLIST_KEY_NSLocationAlwaysAndWhenInUseUsageDescription`: "NavFocus needs your location to provide turn-by-turn navigation and reminders, even when the app is in the background."

**Note**: Do NOT create a separate Info.plist file. Xcode auto-generates it. Use `INFOPLIST_KEY_*` build settings instead.

#### Step 1.3: Configure Capabilities

**Action**: Enable required capabilities in Xcode.

**Capabilities**:
- [ ] **Location When In Use**: Required for GPS navigation
- [ ] **Background Modes**: Location updates (for background navigation)
- [ ] **Push Notifications**: For local reminder notifications

**Manual Steps** (if xcodeproj gem cannot configure):
1. Open project in Xcode
2. Select the app target
3. Go to "Signing & Capabilities" tab
4. Click "+ Capability"
5. Add "Location When In Use"
6. Add "Background Modes" → Check "Location updates"
7. Add "Push Notifications"

**Output**: Create `capabilities.md` documenting any manual steps.

#### Step 1.4: Create Directory Structure

**Action**: Create the module directory structure.

**Commands**:
```bash
mkdir -p NavFocus/Models
mkdir -p NavFocus/ViewModels
mkdir -p NavFocus/Views/Navigation
mkdir -p NavFocus/Views/Compass
mkdir -p NavFocus/Views/Transit
mkdir -p NavFocus/Views/Settings
mkdir -p NavFocus/Views/Components
mkdir -p NavFocus/Services
mkdir -p NavFocus/Data
mkdir -p NavFocus/Extensions
mkdir -p NavFocus/Utilities
mkdir -p NavFocus/Resources/Assets.xcassets/AppIcon.appiconset
mkdir -p NavFocus/Resources/Assets.xcassets/AccentColor.colorset
mkdir -p NavFocus/Resources/Assets.xcassets/MapAssets
```

### Phase 2: Core Data Models

#### Step 2.1: Define Data Models

**Action**: Create Swift model files for core data structures.

**Files to Create**:
1. `Models/NavigationStep.swift`
2. `Models/Route.swift`
3. `Models/FavoriteLocation.swift`
4. `Models/ReminderSettings.swift`
5. `Models/TransitStop.swift`

**Implementation Notes**:
- Use `struct` for value types
- Conform to `Identifiable` for SwiftUI lists
- Conform to `Codable` for persistence and Watch connectivity
- Use `enum` for finite states (e.g., `ManeuverType`)

#### Step 2.2: Create CoreData Model

**Action**: Define CoreData entities for persistence.

**Entities**:
1. **RouteEntity**
   - `id`: UUID (required)
   - `name`: String (optional)
   - `originLatitude`: Double (required)
   - `originLongitude`: Double (required)
   - `destinationLatitude`: Double (required)
   - `destinationLongitude`: Double (required)
   - `createdAt`: Date (required)
   - Relationship: `waypoints` (one-to-many, inverse: WaypointEntity.route)

2. **WaypointEntity**
   - `id`: UUID (required)
   - `latitude`: Double (required)
   - `longitude`: Double (required)
   - `order`: Int16 (required)
   - Relationship: `route` (many-to-one, inverse: RouteEntity.waypoints)

3. **FavoriteLocationEntity**
   - `id`: UUID (required)
   - `name`: String (required)
   - `latitude`: Double (required)
   - `longitude`: Double (required)
   - `icon`: String (optional, e.g., "house", "briefcase", "star")
   - `createdAt`: Date (required)

4. **RouteHistoryEntity**
   - `id`: UUID (required)
   - `routeId`: UUID (required)
   - `startedAt`: Date (required)
   - `completedAt`: Date (optional)
   - `duration`: Double (optional, in seconds)
   - `distance`: Double (optional, in meters)

**Critical Rules**:
- ALL attributes MUST be optional OR have a default value
- ALL relationships MUST have inverse relationships
- Use `NSPersistentContainer` first during development
- Switch to `NSPersistentCloudKitContainer` only when CloudKit is fully configured

#### Step 2.3: Implement PersistenceController

**Action**: Create CoreData stack manager.

**File**: `Data/PersistenceController.swift`

**Implementation**:
```swift
import CoreData

@MainActor
class PersistenceController: ObservableObject {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "NavFocus")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("CoreData failed to load: \(error.localizedDescription)")
            }
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
    
    func save() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Failed to save CoreData context: \(error.localizedDescription)")
            }
        }
    }
}
```

### Phase 3: Core Services

#### Step 3.1: Implement LocationService

**Action**: Create CoreLocation wrapper for GPS and compass.

**File**: `Services/LocationService.swift`

**Responsibilities**:
- Request location authorization
- Start/stop location updates
- Start/stop heading updates (compass)
- Monitor geographic regions (for transit stops)
- Provide current location and heading to ViewModels

**Key Methods**:
- `requestAuthorization()`: Request `whenInUse` authorization
- `startUpdatingLocation()`: Begin GPS updates
- `startUpdatingHeading()`: Begin compass updates
- `startMonitoring(region:)`: Monitor a geographic region
- `stopUpdatingLocation()`: Stop GPS updates
- `stopUpdatingHeading()`: Stop compass updates

**Implementation Notes**:
- Use `CLLocationManagerDelegate` methods to update `@Published` properties
- Handle authorization status changes
- Handle location updates in background (if Background Modes enabled)

#### Step 3.2: Implement MapService

**Action**: Create MapKit wrapper for routing and directions.

**File**: `Services/MapService.swift`

**Responsibilities**:
- Search for locations by name/address
- Calculate routes between locations
- Extract route steps and polylines
- Calculate ETA

**Key Methods**:
- `search(query:completion:)`: Search for locations using `MKLocalSearch`
- `calculateRoute(from:to:transportType:completion:)`: Calculate route using `MKDirections`
- `extractSteps(from:)`: Extract `MKRouteStep` array from `MKRoute`

**Implementation Notes**:
- Use `MKDirectionsTransportType` for different modes (automobile, walking, transit)
- Handle errors gracefully (no route found, network error, etc.)
- Use async/await for asynchronous operations

#### Step 3.3: Implement ReminderService

**Action**: Create UserNotifications wrapper for reminder scheduling.

**File**: `Services/ReminderService.swift`

**Responsibilities**:
- Request notification authorization
- Schedule time-based reminders (e.g., every 15 seconds)
- Schedule location-based reminders (e.g., when approaching a turn)
- Cancel reminders
- Handle notification delivery

**Key Methods**:
- `requestAuthorization()`: Request notification permissions
- `scheduleReminder(title:body:in:)`: Schedule a time-based reminder
- `scheduleLocationReminder(title:body:at:)`: Schedule a location-based reminder
- `cancelAllReminders()`: Cancel all pending reminders
- `cancelReminder(withIdentifier:)`: Cancel a specific reminder

**Implementation Notes**:
- Use `UNUserNotificationCenter` for local notifications
- Use `UNTimeIntervalNotificationTrigger` for time-based reminders
- Use `UNLocationNotificationTrigger` for location-based reminders
- Handle notification delegate methods to customize behavior

#### Step 3.4: Implement HapticService

**Action**: Create haptic feedback engine for turn alerts.

**File**: `Services/HapticService.swift`

**Responsibilities**:
- Play haptic feedback for turn directions
- Play haptic feedback for transit stop alerts
- Customize haptic patterns (light, medium, heavy, success, warning, error)

**Key Methods**:
- `playTurnLeft()`: Play left turn haptic pattern
- `playTurnRight()`: Play right turn haptic pattern
- `playArrival()`: Play arrival haptic pattern
- `playTransitAlert()`: Play transit stop alert haptic

**Implementation Notes**:
- Use `UINotificationFeedbackGenerator` for notification-style haptics
- Use `UIImpactFeedbackGenerator` for impact-style haptics
- Use `UISelectionFeedbackGenerator` for selection-style haptics
- Prepare generators before use to reduce latency

**Haptic Patterns**:
- **Left Turn**: Two light taps (low-high pattern)
- **Right Turn**: Two light taps (high-low pattern)
- **Arrival**: Three medium taps (success pattern)
- **Transit Alert**: Continuous light taps (urgent pattern)

#### Step 3.5: Implement AudioService

**Action**: Create AVFoundation wrapper for voice prompts.

**File**: `Services/AudioService.swift`

**Responsibilities**:
- Speak turn instructions using speech synthesis
- Adjust volume independently from system volume
- Handle audio session interruptions
- Queue multiple voice prompts

**Key Methods**:
- `speak(_:)`: Speak a text string
- `stopSpeaking()`: Stop current speech
- `setVolume(_:)`: Set speech volume (0.0 to 1.0)

**Implementation Notes**:
- Use `AVSpeechSynthesizer` for text-to-speech
- Use `AVSpeechUtterance` to configure speech rate, pitch, volume
- Use `AVAudioSession` to manage audio focus
- Handle `AVSpeechSynthesizerDelegate` methods for speech events

#### Step 3.6: Implement WatchService

**Action**: Create WatchConnectivity wrapper for iPhone-Watch sync.

**File**: `Services/WatchService.swift`

**Responsibilities**:
- Activate WatchConnectivity session
- Send navigation data to Apple Watch
- Receive haptic trigger requests from Apple Watch
- Sync reminder settings to Apple Watch

**Key Methods**:
- `activate()`: Activate WCSession
- `sendNavigationData(_:)`: Send route and current step to Watch
- `sendReminderSettings(_:)`: Send reminder preferences to Watch

**Implementation Notes**:
- Use `WCSession.default` for singleton session
- Check `isReachable` before sending messages
- Use `sendMessage(_:replyHandler:errorHandler:)` for real-time communication
- Use `updateApplicationContext(_:)` for background state sync

### Phase 4: ViewModels

#### Step 4.1: Implement NavigationViewModel

**Action**: Create ViewModel for navigation logic.

**File**: `ViewModels/NavigationViewModel.swift`

**Responsibilities**:
- Manage route calculation and updates
- Track current location and distance to next turn
- Update turn instructions based on location
- Trigger reminders based on distance/time
- Coordinate with LocationService, MapService, ReminderService

**Published Properties**:
- `route: MKRoute?`: Current route
- `currentStep: NavigationStep?`: Current navigation step
- `distanceToNextTurn: Double`: Distance in meters
- `timeToNextTurn: Double`: Time in seconds
- `isNavigating: Bool`: Navigation state
- `transportType: MKDirectionsTransportType`: Current transport mode

**Key Methods**:
- `startNavigation(to:)`: Begin navigation to destination
- `stopNavigation()`: End navigation
- `updateCurrentStep()`: Update step based on current location

**Implementation Notes**:
- Use `@MainActor` for thread safety
- Use `@Published` for SwiftUI reactivity
- Inject services via initializer for testability
- Use `CLLocationManagerDelegate` to react to location updates

#### Step 4.2: Implement ReminderViewModel

**Action**: Create ViewModel for reminder scheduling.

**File**: `ViewModels/ReminderViewModel.swift`

**Responsibilities**:
- Manage reminder settings (frequency, volume, haptic)
- Schedule time-based reminders (e.g., every 15s, 30s, 1min)
- Schedule distance-based reminders (e.g., 100m, 200m before turn)
- Trigger haptic and audio feedback
- Persist settings to UserDefaults

**Published Properties**:
- `reminderFrequency: TimeInterval`: Reminder interval in seconds
- `reminderVolume: Float`: Volume level (0.0 to 1.0)
- `hapticEnabled: Bool`: Haptic feedback toggle
- `voiceEnabled: Bool`: Voice prompt toggle
- `transitAlertStops: Int`: Number of stops before arrival to alert

**Key Methods**:
- `scheduleNextReminder()`: Schedule the next reminder
- `triggerReminder()`: Play haptic and audio feedback
- `updateSettings(_:)`: Update reminder preferences
- `saveSettings()`: Persist settings to UserDefaults

**Implementation Notes**:
- Use `Timer` for time-based reminders
- Use `CLLocationManager` distance filtering for distance-based reminders
- Coordinate with `HapticService` and `AudioService`
- Use `UserDefaults` for persistence

#### Step 4.3: Implement CompassViewModel

**Action**: Create ViewModel for compass logic.

**File**: `ViewModels/CompassViewModel.swift`

**Responsibilities**:
- Track current compass heading
- Calculate direction to next turn
- Calculate angle to destination
- Update compass display

**Published Properties**:
- `heading: Double`: Current compass heading in degrees
- `directionToNextTurn: Double`: Bearing to next turn in degrees
- `distanceToNextTurn: Double`: Distance in meters
- `nextTurnInstruction: String`: Turn instruction text

**Key Methods**:
- `updateHeading(_:)`: Update heading from CoreLocation
- `calculateDirectionToNextTurn()`: Calculate bearing from current location to next turn
- `calculateAngleToDestination()`: Calculate bearing from current location to destination

**Implementation Notes**:
- Use `CLHeading.trueHeading` for true north
- Use `CLHeading.magneticHeading` for magnetic north
- Calculate bearing using `CLLocationCoordinate2D` bearing formula
- Smooth heading updates to reduce jitter

#### Step 4.4: Implement TransitViewModel

**Action**: Create ViewModel for transit tracking.

**File**: `ViewModels/TransitViewModel.swift`

**Responsibilities**:
- Track transit stops along route
- Monitor distance to next stop
- Trigger stop alerts at configured intervals
- Update stop list display

**Published Properties**:
- `stops: [TransitStop]`: List of transit stops
- `currentStop: TransitStop?`: Current or approaching stop
- `nextStop: TransitStop?`: Next stop
- `stopsRemaining: Int`: Number of stops until destination
- `alertTriggered: Bool`: Stop alert state

**Key Methods**:
- `loadStops(for:)`: Load stops for a transit route
- `updateCurrentStop()`: Update current stop based on location
- `triggerStopAlert()`: Trigger alert for approaching stop
- `dismissAlert()`: Dismiss stop alert

**Implementation Notes**:
- Use `MKRouteStep` transit information to extract stops
- Use `CLLocationManager` region monitoring for stop proximity
- Use `ReminderService` for stop alerts
- Coordinate with `HapticService` for haptic feedback

#### Step 4.5: Implement SettingsViewModel

**Action**: Create ViewModel for settings management.

**File**: `ViewModels/SettingsViewModel.swift`

**Responsibilities**:
- Manage all user preferences
- Load settings from UserDefaults
- Save settings to UserDefaults
- Sync settings to Apple Watch

**Published Properties**:
- `reminderFrequency: TimeInterval`: Reminder interval
- `reminderVolume: Float`: Volume level
- `hapticEnabled: Bool`: Haptic feedback toggle
- `voiceEnabled: Bool`: Voice prompt toggle
- `transitAlertStops: Int`: Stops before arrival alert
- `mapStyle: MapStyle`: Map appearance (standard, satellite, hybrid)

**Key Methods**:
- `loadSettings()`: Load settings from UserDefaults
- `saveSettings()`: Save settings to UserDefaults
- `resetToDefaults()`: Reset all settings to default values
- `syncToWatch()`: Send settings to Apple Watch

**Implementation Notes**:
- Use `UserDefaults` for persistence
- Use `@AppStorage` property wrapper for simple settings
- Use `WatchService` to sync to Apple Watch
- Provide default values for all settings

### Phase 5: Views

#### Step 5.1: Implement MapView

**Action**: Create main map view with route display.

**File**: `Views/Navigation/MapView.swift`

**Features**:
- Display map using `Map` (SwiftUI, iOS 17+)
- Show user location with `UserAnnotation`
- Display route polyline with `MapPolyline`
- Show destination marker with `Marker`
- Support map styles (standard, satellite, hybrid)
- Support camera position control

**Implementation**:
```swift
import SwiftUI
import MapKit

struct MapView: View {
    @Binding var route: MKRoute?
    @Binding var destination: CLLocationCoordinate2D?
    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    
    var body: some View {
        Map(position: $cameraPosition) {
            UserAnnotation()
            
            if let destination {
                Marker("Destination", coordinate: destination)
            }
            
            if let route {
                MapPolyline(route.polyline)
                    .stroke(.blue, lineWidth: 5)
            }
        }
        .mapStyle(.standard)
    }
}
```

#### Step 5.2: Implement TurnInstructionView

**Action**: Create turn instruction overlay.

**File**: `Views/Navigation/TurnInstructionView.swift`

**Features**:
- Display current turn instruction
- Show distance to next turn
- Show street name
- Show turn direction icon (left, right, straight, U-turn)
- Floating panel design with blur background

**Implementation Notes**:
- Use `VStack` for vertical layout
- Use `HStack` for icon + text layout
- Use `.background(.ultraThinMaterial)` for blur effect
- Use `.cornerRadius()` for rounded corners
- Use `.shadow()` for depth effect

#### Step 5.3: Implement RouteSearchView

**Action**: Create destination search interface.

**File**: `Views/Navigation/RouteSearchView.swift`

**Features**:
- Search bar for destination input
- Search results list
- Favorite locations quick access
- Recent destinations list
- Current location as origin

**Implementation Notes**:
- Use `MKLocalSearch` for location search
- Use `List` for search results
- Use `Section` for grouping (Favorites, Recent)
- Use `NavigationLink` to start navigation

#### Step 5.4: Implement CompassView

**Action**: Create compass display.

**File**: `Views/Compass/CompassView.swift`

**Features**:
- Circular compass display
- North indicator
- Direction arrow to next turn
- Distance to next turn
- Smooth rotation animation

**Implementation Notes**:
- Use `GeometryReader` for circular layout
- Use `Rotation3DEffect` for compass rotation
- Use `withAnimation(.linear)` for smooth heading updates
- Use `Text` for distance display

#### Step 5.5: Implement TransitListView

**Action**: Create transit stops list.

**File**: `Views/Transit/TransitListView.swift`

**Features**:
- List of transit stops
- Current stop highlighted
- Next stop indicator
- Stops remaining counter
- Stop alert trigger

**Implementation Notes**:
- Use `List` for stop list
- Use `ForEach` for stop items
- Use different row styles for current/upcoming stops
- Use `ProgressView` for stop progress

#### Step 5.6: Implement SettingsView

**Action**: Create main settings view.

**File**: `Views/Settings/SettingsView.swift`

**Features**:
- Reminder frequency picker (15s, 30s, 1min, custom)
- Volume slider
- Haptic feedback toggle
- Voice prompt toggle
- Transit alert stops picker
- Map style picker
- Contact support link
- Privacy policy link
- Terms of use link
- About section

**Implementation Notes**:
- Use `Form` for settings layout
- Use `Section` for grouping settings
- Use `Picker` for selection controls
- Use `Toggle` for boolean settings
- Use `Slider` for volume control
- Use `Link` for external URLs

#### Step 5.7: Implement ContactSupportView

**Action**: Create contact support form.

**File**: `Views/Settings/ContactSupportView.swift`

**Features**:
- Topic selector (optional)
- Name field (optional)
- Email field (required)
- Message field (required, min 3 lines)
- Submit button
- Loading state during submission
- Success/error alert

**Implementation Notes**:
- Use `Form` for layout
- Use `TextField` for name and email
- Use `TextEditor` for message
- Use `Button` for submit
- Use `@State` for form fields
- Use `Alert` for success/error messages

**Backend Integration**:
- POST to feedback backend URL
- JSON body: `{ "topic": String?, "name": String?, "email": String, "message": String }`
- Handle network errors gracefully

#### Step 5.8: Implement ContentView

**Action**: Create main tab view.

**File**: `ContentView.swift`

**Features**:
- TabView with 3 tabs: Map, Compass, Settings
- Tab icons using SF Symbols
- Tab labels
- Navigation stack for each tab

**Implementation**:
```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                MapView()
            }
            .tabItem {
                Label("Map", systemImage: "map")
            }
            
            NavigationStack {
                CompassView()
            }
            .tabItem {
                Label("Compass", systemImage: "location.north")
            }
            
            NavigationStack {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gear")
            }
        }
    }
}
```

#### Step 5.9: Implement NavFocusApp

**Action**: Create app entry point.

**File**: `NavFocusApp.swift`

**Features**:
- App struct conforming to `App` protocol
- Initialize `PersistenceController` as environment object
- Initialize `LocationService` as environment object
- Set root view to `ContentView`

**Implementation**:
```swift
import SwiftUI

@main
struct NavFocusApp: App {
    @StateObject private var persistenceController = PersistenceController.shared
    @StateObject private var locationService = LocationService()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(locationService)
        }
    }
}
```

### Phase 6: Apple Watch Integration

#### Step 6.1: Create watchOS App Target

**Action**: Add watchOS app target to Xcode project.

**Steps**:
1. In Xcode, go to File → New → Target
2. Select "watchOS" → "App"
3. Configure:
   - Product Name: `NavFocus Watch`
   - Team: Your development team
   - Language: Swift
   - User Interface: SwiftUI
   - Watch-only app: No (companion iPhone app)

#### Step 6.2: Implement Watch App

**Action**: Create watchOS app with haptic navigation.

**Files**:
- `NavFocusWatchApp.swift`: Watch app entry point
- `WatchContentView.swift`: Main watch view
- `WatchCompassView.swift`: Compass on Watch
- `WatchTurnInstructionView.swift`: Turn instruction on Watch

**Features**:
- Display current turn instruction
- Display distance to next turn
- Display compass direction
- Trigger haptic feedback for turns
- Sync with iPhone app

#### Step 6.3: Implement Watch Complication

**Action**: Create watch face complication for quick access.

**File**: `ComplicationController.swift`

**Features**:
- Display next turn instruction
- Display distance to next turn
- Display ETA
- Update complication timeline

**Implementation Notes**:
- Use `CLKComplicationDataSource` for complication data
- Use `CLKComplicationTemplate` for complication layout
- Update complication when navigation state changes

### Phase 7: Testing and Validation

#### Step 7.1: Unit Tests

**Action**: Write unit tests for ViewModels and Services.

**Test Targets**:
- `NavigationViewModelTests`: Test route calculation, step updates
- `ReminderViewModelTests`: Test reminder scheduling, settings persistence
- `CompassViewModelTests`: Test heading calculations, bearing calculations
- `TransitViewModelTests`: Test stop tracking, alert triggers
- `LocationServiceTests`: Test location updates, heading updates
- `MapServiceTests`: Test route calculation, search functionality

**Testing Framework**: XCTest

**Implementation Notes**:
- Use dependency injection to mock services
- Use `XCTestExpectation` for asynchronous tests
- Test edge cases (no route found, location denied, etc.)

#### Step 7.2: UI Tests

**Action**: Write UI tests for critical user flows.

**Test Flows**:
- Search for destination and start navigation
- Change reminder frequency
- Toggle haptic feedback
- Toggle voice prompts
- Submit contact support form

**Testing Framework**: XCUITest

**Implementation Notes**:
- Use `XCUIApplication` to launch app
- Use `XCUIElement` to interact with UI elements
- Use `XCTAssert` to verify expected behavior

#### Step 7.3: Build and Run Tests

**Action**: Build and run app on iOS Simulator.

**Commands**:
```bash
# Build for simulator
mcp_XcodeBuildMCP_build_sim

# Run on simulator
mcp_XcodeBuildMCP_build_run_sim

# Run tests
mcp_XcodeBuildMCP_test_sim
```

**Validation**:
- [ ] App builds without errors
- [ ] App launches on simulator
- [ ] Map loads correctly
- [ ] Location permission requested
- [ ] Search for destination works
- [ ] Navigation starts successfully
- [ ] Turn instructions display correctly
- [ ] Reminders trigger at configured intervals
- [ ] Haptic feedback works (on real device)
- [ ] Voice prompts work
- [ ] Settings persist across app restarts
- [ ] Apple Watch app syncs correctly

### Phase 8: App Icon and Assets

#### Step 8.1: Generate App Icon

**Action**: Generate app icon using Wanx image generation API.

**Icon Prompt**: "A minimalist iOS app icon for a navigation app called NavFocus, designed for ADHD users. Features a stylized compass or map pin with focus rays, using calming blue and green colors. Clean, modern, Apple design aesthetic. No text, no gradients, flat design with subtle depth."

**Steps**:
1. Use `wanx-image-gen` skill to generate icon
2. Generate multiple variations (1024x1024)
3. Select best icon
4. Resize to all required sizes (20x20 to 1024x1024)
5. Add to `Assets.xcassets/AppIcon.appiconset`

**Output**: Create `icon.md` documenting icon details.

#### Step 8.2: Configure App Icon

**Action**: Update `Contents.json` in AppIcon.appiconset.

**File**: `Assets.xcassets/AppIcon.appiconset/Contents.json`

**Sizes Required**:
- iPhone: 20x20 (@2x, @3x), 29x29 (@2x, @3x), 40x40 (@2x, @3x), 60x60 (@2x, @3x)
- iPad: 20x20 (@1x, @2x), 29x29 (@1x, @2x), 40x40 (@1x, @2x), 76x76 (@1x, @2x), 83.5x83.5 (@2x)
- App Store: 1024x1024

### Phase 9: Policy Pages and GitHub Deployment

#### Step 9.1: Create Policy Pages

**Action**: Create HTML pages for support, privacy policy, and terms of use.

**Pages**:
1. **Support Page** (`support/index.html`)
   - App support information
   - Contact email
   - FAQs
   - Troubleshooting tips

2. **Privacy Policy** (`privacy/index.html`)
   - Data collection (location only)
   - Data usage (navigation only)
   - Data storage (on-device only)
   - Third-party sharing (none)
   - User rights
   - Contact information

3. **Terms of Use** (`terms/index.html`)
   - Usage terms
   - Liability limitations
   - Intellectual property
   - User responsibilities
   - Termination clause

**Implementation Notes**:
- Use native American English
- Use clean, minimal HTML with iOS-native styling
- Use `-apple-system` font family
- Max width 800px for readability

#### Step 9.2: Deploy Policy Pages to GitHub Pages

**Action**: Create GitHub repositories and deploy policy pages.

**Repositories**:
1. `NavFocus-support`: Support page
2. `NavFocus-privacy`: Privacy policy
3. `NavFocus-terms`: Terms of use

**Steps**:
1. Create GitHub repositories using API
2. Add HTML files to each repository
3. Create `.github/workflows/deploy.yml` for GitHub Actions
4. Enable GitHub Pages via API
5. Push files to repositories
6. Verify deployment URLs

**Output**: Create `nowgit.md` documenting all git repos and deployment URLs.

#### Step 9.3: Update SettingsView Links

**Action**: Update SettingsView to link to deployed policy pages.

**URLs**:
- Support: `https://<GITHUB_USER>.github.io/NavFocus-support/`
- Privacy Policy: `https://<GITHUB_USER>.github.io/NavFocus-privacy/`
- Terms of Use: `https://<GITHUB_USER>.github.io/NavFocus-terms/`

**Implementation**:
```swift
Link("Support", destination: URL(string: "https://asunnyboy861.github.io/NavFocus-support/")!)
Link("Privacy Policy", destination: URL(string: "https://asunnyboy861.github.io/NavFocus-privacy/")!)
Link("Terms of Use", destination: URL(string: "https://asunnyboy861.github.io/NavFocus-terms/")!)
```

### Phase 10: App Store Connect Metadata

#### Step 10.1: Write App Store Metadata

**Action**: Create App Store listing content.

**File**: `keytext.md`

**Content**:
1. **App Name**: NavFocus - ADHD Navigation & Focus Drive Helper
2. **Subtitle**: Navigation for ADHD Drivers (max 30 chars)
3. **Promotional Text** (max 170 chars, pure ASCII, no emoji):
   ```
   Never miss a turn again. NavFocus provides customizable, high-frequency turn reminders designed specifically for ADHD drivers. Stay focused, arrive safely.
   ```
4. **Description** (max 4000 chars, pure ASCII, no emoji):
   ```
   NavFocus is the first navigation app designed specifically for adults with ADHD. Never miss a turn or overshoot your bus stop again with customizable, high-frequency reminders.

   WHY NAVFOCUS?

   Traditional navigation apps like Google Maps and Apple Maps give you one reminder per turn—but if you have ADHD, that's often not enough. Your attention drifts, you get lost in thought or music, and suddenly you've missed your exit.

   NavFocus solves this with ADHD-optimized features:

   • CUSTOMIZABLE TURN REMINDERS: Choose how often you want reminders—every 15 seconds, 30 seconds, 1 minute, or custom intervals. Stay focused on every turn.

   • PROGRESSIVE TRANSIT ALERTS: Never overshoot your bus or train stop again. Get alerts 1, 2, 3, or more stops before your destination.

   • HAPTIC FEEDBACK: Feel gentle taps on your wrist through Apple Watch, or vibrations on your iPhone. Dual-channel alerts (voice + haptic) ensure you never miss a turn.

   • INDEPENDENT VOLUME CONTROL: Set reminder volume separately from your music or podcast volume. Listen to what you love without missing navigation cues.

   • REAL-TIME COMPASS: Always know which direction you're heading with a live compass display. Perfect for when you're walking or biking.

   • APPLE WATCH INTEGRATION: Get turn-by-turn directions right on your wrist with haptic feedback. No need to look at your phone.

   PERFECT FOR:

   • Adults with ADHD who struggle with time blindness while driving
   • Commuters who miss turns or bus stops due to distraction
   • Anyone who zones out while listening to music or podcasts
   • Drivers who need more than one reminder per turn

   HOW IT WORKS:

   1. Enter your destination
   2. Choose your transport mode (driving, walking, transit)
   3. Set your reminder frequency (15s, 30s, 1min, or custom)
   4. Start navigating with ADHD-optimized turn reminders

   PRIVACY FIRST:

   • Location data stays on your device
   • No third-party data sharing
   • No account required
   • Works offline with downloaded maps

   SUBSCRIPTION INFORMATION:

   NavFocus Pro Monthly: $2.99/month
   NavFocus Pro Yearly: $19.99/year
   NavFocus Pro Lifetime: $29.99 one-time purchase

   Payment will be charged to your Apple ID account at confirmation of purchase.

   Subscription automatically renews unless it is canceled at least 24 hours before the end of the current period. Your account will be charged for renewal within 24 hours prior to the end of the current period.

   You can manage and cancel your subscriptions by going to your account settings on the App Store after purchase.

   Any unused portion of a free trial period, if offered, will be forfeited when the user purchases a subscription to that publication, where applicable.

   Privacy Policy: https://asunnyboy861.github.io/NavFocus-privacy/
   Terms of Use: https://asunnyboy861.github.io/NavFocus-terms/
   ```

5. **Keywords** (max 100 chars, pure ASCII, comma-separated):
   ```
   ADHD,navigation,turn reminders,transit alerts,focus,driving,compass,Apple Watch,haptic
   ```

6. **Screenshots**: 
   - iPhone 6.7": 3-5 screenshots showing map, turn instructions, compass, settings
   - iPhone 6.5": 3-5 screenshots
   - iPhone 5.5": 3-5 screenshots
   - iPad Pro 12.9": 3-5 screenshots (if supporting iPad)

7. **App Preview Videos**: Optional, 15-30 seconds showing navigation in action

**Validation**:
- [ ] Promotional text ≤ 170 characters
- [ ] Description ≤ 4000 characters
- [ ] Keywords ≤ 100 characters
- [ ] All text is pure ASCII (no emoji, no special characters)
- [ ] Subscription terms included in description
- [ ] Privacy Policy and Terms of Use links included

### Phase 11: Final Build and Deployment

#### Step 11.1: Final Build Test

**Action**: Perform final build and test.

**Commands**:
```bash
# Clean build
mcp_XcodeBuildMCP_clean

# Build for simulator
mcp_XcodeBuildMCP_build_sim

# Run on simulator
mcp_XcodeBuildMCP_build_run_sim

# Run tests
mcp_XcodeBuildMCP_test_sim
```

**Validation**:
- [ ] Build succeeds without errors
- [ ] All tests pass
- [ ] App launches on simulator
- [ ] All features work correctly
- [ ] No crashes or memory leaks
- [ ] UI renders correctly on all device sizes

#### Step 11.2: Push to GitHub

**Action**: Commit and push all code to GitHub.

**Steps**:
1. Create `.gitignore` file
2. Initialize git repository
3. Add all files
4. Commit with message: "Initial commit: NavFocus iOS app"
5. Create remote repository on GitHub
6. Push to GitHub

**Commands**:
```bash
git init
git add -A
git commit -m "Initial commit: NavFocus iOS app"
git remote add origin git@github.com:asunnyboy861/NavFocus.git
git push -u origin main --force
```

**Output**: Update `nowgit.md` with main app repository URL.

#### Step 11.3: Archive and Upload to App Store Connect

**Action**: Archive app for distribution and upload to App Store Connect.

**Steps**:
1. In Xcode, select "Any iOS Device (arm64)" as build target
2. Go to Product → Archive
3. Wait for archive to complete
4. Validate archive
5. Distribute app to App Store Connect
6. Fill in App Store Connect metadata
7. Submit for review

**Note**: This step requires manual action in Xcode and App Store Connect.

---

## UI/UX Design Specifications

### Design Philosophy

**Core Principles**:
1. **Minimal Cognitive Load**: ADHD users are easily overwhelmed. Keep UI clean, simple, and focused.
2. **High Contrast and Clarity**: Ensure text is readable at a glance. Use large fonts and high contrast colors.
3. **Immediate Feedback**: Provide instant visual, haptic, and audio feedback for all actions.
4. **Customizable**: Allow users to adjust reminder frequency, volume, and haptic intensity to match their needs.

### Color Palette

**Primary Colors**:
- **Accent Color**: `#007AFF` (Apple Blue) - Primary actions, active states
- **Background**: `#F2F2F7` (iOS Light Gray) - Main background
- **Secondary Background**: `#FFFFFF` (White) - Cards and panels
- **Text Primary**: `#000000` (Black) - Main text
- **Text Secondary**: `#8E8E93` (iOS Gray) - Secondary text

**Semantic Colors**:
- **Success**: `#34C759` (Green) - Arrival, completion
- **Warning**: `#FF9500` (Orange) - Approaching turn
- **Error**: `#FF3B30` (Red) - Wrong direction, missed turn
- **Info**: `#5AC8FA` (Light Blue) - Informational alerts

**Dark Mode Colors**:
- **Background**: `#000000` (Black)
- **Secondary Background**: `#1C1C1E` (Dark Gray)
- **Text Primary**: `#FFFFFF` (White)
- **Text Secondary**: `#8E8E93` (Gray)

### Typography

**Font Family**: SF Pro (Apple's system font)

**Text Styles**:
- **Large Title**: 34pt, bold - Screen titles
- **Title**: 28pt, bold - Section headers
- **Headline**: 17pt, semibold - Card titles, turn instructions
- **Body**: 17pt, regular - Main content
- **Callout**: 16pt, regular - Secondary content
- **Subheadline**: 15pt, regular - Tertiary content
- **Footnote**: 13pt, regular - Captions, timestamps
- **Caption**: 12pt, regular - Labels, hints

**Accessibility**:
- Support Dynamic Type (xSmall to xxxLarge)
- Minimum 17pt for body text
- Use scalable fonts (`.font(.body)`, `.font(.headline)`)

### Layout and Spacing

**Margins**:
- Standard margin: 16pt
- Compact margin: 8pt
- Comfortable margin: 24pt

**Padding**:
- Card padding: 16pt
- Button padding: 12pt vertical, 16pt horizontal
- List row padding: 12pt vertical

**Spacing**:
- Between sections: 24pt
- Between elements: 8pt
- Between related elements: 4pt

**Safe Areas**:
- Respect safe area insets on all devices
- Use `.padding()` modifier with safe area
- Avoid placing interactive elements near edges

### Component Design

#### 1. Map View

**Design**:
- Full-screen map with floating controls
- User location: Blue dot with pulsing circle
- Route polyline: Blue, 5pt stroke
- Destination marker: Red pin or custom icon
- Turn instruction overlay: Floating panel at top

**Behavior**:
- Auto-center on user location during navigation
- Allow manual pan and zoom
- Show compass button to re-center
- Show 3D button for perspective view

#### 2. Turn Instruction Panel

**Design**:
- Floating panel with blur background
- Width: 90% of screen width, max 400pt
- Height: Auto-sized to content
- Position: Top center, below status bar
- Corner radius: 12pt
- Shadow: 4pt blur, 0.3 opacity

**Content**:
- Turn direction icon (left, right, straight, U-turn)
- Distance to turn (large number, e.g., "500 ft")
- Street name (bold text)
- Maneuver instruction (e.g., "Turn right onto Main St")

**Animation**:
- Fade in when turn approaches
- Slide up when new turn becomes active
- Fade out after turn completed

#### 3. Compass View

**Design**:
- Circular compass display
- Diameter: 200pt (adjustable for screen size)
- North indicator: Red triangle at top
- Direction arrow: Blue arrow pointing to next turn
- Distance label: Below compass, large text
- Instruction label: Below distance, regular text

**Behavior**:
- Smooth rotation animation (linear, 0.3s duration)
- Update heading in real-time
- Show bearing to next turn
- Show distance to next turn

#### 4. Settings View

**Design**:
- Standard iOS `Form` layout
- Grouped sections with headers
- Inline controls (toggles, sliders, pickers)
- Navigation links to sub-pages

**Sections**:
1. **Reminders**: Frequency picker, volume slider, toggles
2. **Transit**: Stop alert picker
3. **Map**: Style picker, 3D toggle
4. **Support**: Contact support, FAQs
5. **Legal**: Privacy policy, terms of use
6. **About**: App version, credits

#### 5. Buttons

**Primary Button**:
- Background: Accent color
- Text: White, headline font
- Corner radius: 12pt
- Height: 50pt
- Full width (with margins)

**Secondary Button**:
- Background: Clear
- Border: 1pt, accent color
- Text: Accent color, headline font
- Corner radius: 12pt
- Height: 50pt

**Icon Button**:
- Size: 44x44pt (minimum tap target)
- Icon: SF Symbol, 20pt
- Background: Clear or light gray
- Corner radius: 8pt

#### 6. Alerts and Modals

**Alert Style**:
- Standard iOS alert
- Title: Bold, headline font
- Message: Regular, body font
- Buttons: Primary and cancel styles

**Modal Presentation**:
- Sheet style for forms (e.g., contact support)
- Full-screen for immersive experiences (e.g., map)
- Navigation push for hierarchical content

### Interaction Patterns

#### 1. Turn Reminder Flow

```
User starts navigation
  ↓
App calculates route
  ↓
App extracts turn steps
  ↓
App starts location updates
  ↓
[LOOP: Every location update]
  ↓
Calculate distance to next turn
  ↓
If distance < threshold (e.g., 500m)
  ↓
Schedule reminder at configured interval
  ↓
Trigger reminder (voice + haptic)
  ↓
Display turn instruction panel
  ↓
[END LOOP]
  ↓
User completes turn
  ↓
Update to next turn
```

#### 2. Transit Stop Alert Flow

```
User starts transit navigation
  ↓
App loads transit stops
  ↓
App starts location updates
  ↓
[LOOP: Every location update]
  ↓
Determine current stop
  ↓
Calculate stops remaining
  ↓
If stops remaining ≤ configured threshold
  ↓
Trigger stop alert (voice + haptic)
  ↓
Display stop alert panel
  ↓
[END LOOP]
  ↓
User arrives at destination
```

#### 3. Settings Change Flow

```
User changes setting
  ↓
ViewModel updates @Published property
  ↓
SwiftUI re-renders view
  ↓
ViewModel saves to UserDefaults
  ↓
If Watch connected, sync to Watch
  ↓
Watch updates settings
```

### Accessibility Features

#### VoiceOver Support

**Labels**:
- Map: "Map showing your current location and route to destination"
- Turn instruction: "Turn right in 500 feet onto Main Street"
- Compass: "Compass pointing north. Next turn is 200 feet to your right"
- Settings: "Reminder frequency: 30 seconds. Double-tap to change"

**Hints**:
- Turn instruction: "Swipe up for next turn, swipe down for previous turn"
- Compass: "Adjust heading by rotating device"

**Traits**:
- Buttons: `.button` trait
- Sliders: `.adjustable` trait
- Images: `.image` trait with description

#### Dynamic Type

**Support all text scaling sizes**:
- xSmall: 14pt body
- Small: 15pt body
- Medium: 16pt body
- Large: 17pt body (default)
- xLarge: 19pt body
- xxLarge: 21pt body
- xxxLarge: 23pt body

**Layout Adjustments**:
- Use `VStack` and `HStack` with spacing
- Avoid fixed widths and heights
- Use `.frame(maxWidth: .infinity)` for flexible layouts

#### Reduce Motion

**Alternative Animations**:
- Replace slide animations with fade
- Reduce animation duration
- Disable parallax effects

#### Color and Contrast

**High Contrast Mode**:
- Increase text contrast ratio to 7:1
- Use thicker borders and strokes
- Avoid subtle color differences

**Color Blindness**:
- Don't rely on color alone
- Use shapes and icons for turn directions
- Use patterns for map overlays

---

## Code Generation Rules

### Rule 1: Functional Module Principle

**Principle**: One feature per module. Single responsibility, high cohesion, low coupling.

**Implementation**:
- Each feature has its own directory under `Views/` and `ViewModels/`
- Each service handles one specific domain (Location, Map, Reminder, etc.)
- Models are separated from business logic
- Extensions are grouped by extended type

**Example**:
```
Views/Navigation/
  - MapView.swift (UI for map display)
  - TurnInstructionView.swift (UI for turn instructions)
  - RouteSearchView.swift (UI for destination search)

ViewModels/
  - NavigationViewModel.swift (Logic for navigation)

Services/
  - MapService.swift (MapKit wrapper)
  - LocationService.swift (CoreLocation wrapper)
```

### Rule 2: Code Reuse and Minimal Code Principle

**Principle**: Merge similar code. Follow the "Rule of Three" (abstract after encountering three times). Minimize code.

**Implementation**:
- Create reusable components in `Views/Components/`
- Use protocol-oriented programming for services
- Extract common logic into extensions
- Use Swift's built-in features (e.g., `map`, `filter`, `reduce`)

**Example**:
```swift
// Reusable floating panel component
struct FloatingPanel<Content: View>: View {
    let content: Content
    
    var body: some View {
        content
            .background(.ultraThinMaterial)
            .cornerRadius(12)
            .shadow(radius: 4)
            .padding()
    }
}

// Usage
FloatingPanel {
    TurnInstructionView(step: currentStep)
}
```

### Rule 3: Clean Refactoring

**Principle**: When replacing code/modules, clean up deprecated/redundant code. Mark deprecated, verify no impact, delete. Commit message notes cleanup scope.

**Implementation**:
- Mark deprecated code with `@available(*, deprecated)` attribute
- Add comment explaining why code is deprecated
- Remove deprecated code after verification
- Update commit message to note cleanup scope

**Example**:
```swift
// OLD (deprecated)
@available(*, deprecated, message: "Use calculateBearing(to:) instead")
func getDirection(to coordinate: CLLocationCoordinate2D) -> Double {
    // Old implementation
}

// NEW (replacement)
func calculateBearing(to coordinate: CLLocationCoordinate2D) -> Double {
    // New implementation
}

// After verification, remove old method
```

### Rule 4: Open Source First

**Principle**: If similar open-source GitHub projects exist, integrate/secondary-develop on top of them to save time and reduce errors.

**Implementation**:
- Search for existing navigation projects on GitHub
- Evaluate project quality (stars, forks, activity, license)
- Integrate or adapt code with proper attribution
- Convert to Swift/SwiftUI if necessary

**Note**: For NavFocus, no specific GitHub projects were mentioned in the Chinese guide. We will use Apple's native frameworks (MapKit, CoreLocation) as the foundation.

### Rule 5: Apple Native First

**Principle**: Prioritize Apple native system code. If secondary-developed projects are not native, convert them to native Swift/SwiftUI.

**Implementation**:
- Use SwiftUI for all UI (no UIKit except where necessary)
- Use MapKit for maps and navigation
- Use CoreLocation for GPS and compass
- Use UserNotifications for reminders
- Use CoreData for persistence
- Use WatchConnectivity for Apple Watch sync

**Example**:
```swift
// Use SwiftUI Map (iOS 17+)
Map(position: $cameraPosition) {
    UserAnnotation()
    MapPolyline(route.polyline)
        .stroke(.blue, lineWidth: 5)
}

// Instead of UIKit MKMapView
// let mapView = MKMapView()
```

### Rule 6: No Comments Unless Asked

**Principle**: Do not add comments in code unless explicitly asked.

**Implementation**:
- Write self-documenting code with clear naming
- Use descriptive variable and function names
- Avoid redundant comments that repeat code
- Add comments only for complex algorithms or non-obvious logic

---

## Testing & Validation Standards

### Unit Testing Standards

**Coverage Target**: 70% minimum code coverage

**Test Categories**:
1. **ViewModel Tests**: Test business logic and state management
2. **Service Tests**: Test framework wrappers and integrations
3. **Model Tests**: Test data structures and Codable conformance
4. **Extension Tests**: Test utility functions and calculations

**Test Structure**:
```swift
import XCTest
@testable import NavFocus

class NavigationViewModelTests: XCTestCase {
    var sut: NavigationViewModel!
    var mockLocationService: MockLocationService!
    var mockMapService: MockMapService!
    
    override func setUp() {
        super.setUp()
        mockLocationService = MockLocationService()
        mockMapService = MockMapService()
        sut = NavigationViewModel(
            locationService: mockLocationService,
            mapService: mockMapService
        )
    }
    
    override func tearDown() {
        sut = nil
        mockLocationService = nil
        mockMapService = nil
        super.tearDown()
    }
    
    func testStartNavigationCalculatesRoute() async {
        // Given
        let destination = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
        
        // When
        await sut.startNavigation(to: destination)
        
        // Then
        XCTAssertNotNil(sut.route)
        XCTAssertTrue(sut.isNavigating)
    }
}
```

### UI Testing Standards

**Test Flows**:
1. **Navigation Flow**: Search destination → Start navigation → Receive reminders
2. **Settings Flow**: Change settings → Verify persistence → Check Watch sync
3. **Compass Flow**: Rotate device → Verify compass updates → Check direction
4. **Transit Flow**: Start transit navigation → Receive stop alerts → Arrive at destination

**Test Structure**:
```swift
import XCTest

class NavigationUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
    }
    
    func testSearchAndNavigate() {
        // Tap search bar
        let searchBar = app.searchFields["Search destination"]
        searchBar.tap()
        searchBar.typeText("San Francisco\n")
        
        // Tap search result
        app.buttons["San Francisco, CA"].tap()
        
        // Verify navigation started
        XCTAssertTrue(app.otherElements["TurnInstructionView"].exists)
    }
}
```

### Integration Testing Standards

**Test Scenarios**:
1. **Location Permission**: Request permission → Grant → Verify location updates
2. **Notification Permission**: Request permission → Grant → Verify reminders work
3. **Watch Connectivity**: Pair Watch → Sync settings → Verify Watch receives data
4. **Background Navigation**: Start navigation → Background app → Verify reminders continue

### Performance Testing Standards

**Metrics**:
- **App Launch Time**: < 2 seconds
- **Map Load Time**: < 1 second
- **Route Calculation**: < 3 seconds
- **Location Update Frequency**: 1 Hz (1 update per second)
- **Memory Usage**: < 100 MB during navigation
- **Battery Drain**: < 10% per hour during active navigation

**Tools**:
- Xcode Instruments (Time Profiler, Allocations, Energy Log)
- XCTest performance tests

### Validation Checklist

**Pre-Build Validation**:
- [ ] All code compiles without errors
- [ ] No compiler warnings
- [ ] All tests pass
- [ ] Code coverage ≥ 70%

**Post-Build Validation**:
- [ ] App launches on simulator
- [ ] App launches on real device
- [ ] Location permission requested
- [ ] Notification permission requested
- [ ] Map loads correctly
- [ ] Search works
- [ ] Navigation starts
- [ ] Turn instructions display
- [ ] Reminders trigger
- [ ] Haptic feedback works
- [ ] Voice prompts work
- [ ] Compass updates
- [ ] Settings persist
- [ ] Watch app syncs

**App Store Validation**:
- [ ] App icon configured
- [ ] Launch screen configured
- [ ] All required metadata filled
- [ ] Screenshots uploaded
- [ ] Privacy policy link works
- [ ] Terms of use link works
- [ ] Subscription terms included in description
- [ ] No placeholder content

---

## Build & Deployment Checklist

### Pre-Deployment Checklist

**Code Quality**:
- [ ] All code follows Swift style guidelines
- [ ] No force unwrapping (!) except where explicitly safe
- [ ] All optionals properly handled
- [ ] No memory leaks (use weak/unowned references where needed)
- [ ] All async operations properly cancelled on view dismissal

**Security**:
- [ ] No hardcoded secrets or API keys
- [ ] Location data stays on device
- [ ] No third-party data sharing
- [ ] HTTPS for all network requests
- [ ] Proper input validation

**Performance**:
- [ ] App launches in < 2 seconds
- [ ] Map loads in < 1 second
- [ ] No UI jank (60fps animations)
- [ ] Memory usage < 100 MB
- [ ] Battery drain < 10% per hour

**Accessibility**:
- [ ] VoiceOver works on all screens
- [ ] Dynamic Type supported
- [ ] Reduce Motion supported
- [ ] High Contrast supported
- [ ] Minimum tap target 44x44pt

### Build Process

**Step 1: Clean Build**
```bash
mcp_XcodeBuildMCP_clean
```

**Step 2: Build for Simulator**
```bash
mcp_XcodeBuildMCP_build_sim
```

**Step 3: Run Tests**
```bash
mcp_XcodeBuildMCP_test_sim
```

**Step 4: Run on Simulator**
```bash
mcp_XcodeBuildMCP_build_run_sim
```

**Step 5: Build for Device**
- In Xcode, select "Any iOS Device (arm64)"
- Product → Build
- Verify build succeeds

### Deployment Process

**Step 1: Archive**
- In Xcode, Product → Archive
- Wait for archive to complete
- Organizer window opens

**Step 2: Validate**
- Click "Validate App"
- Select distribution certificate
- Verify validation succeeds

**Step 3: Distribute**
- Click "Distribute App"
- Select "App Store Connect"
- Upload to App Store Connect

**Step 4: Configure App Store Connect**
- Fill in all metadata (name, subtitle, description, keywords)
- Upload screenshots (iPhone 6.7", 6.5", 5.5"; iPad Pro 12.9")
- Upload app preview videos (optional)
- Configure pricing and availability
- Configure in-app purchases (if applicable)

**Step 5: Submit for Review**
- Click "Submit for Review"
- Answer export compliance questions
- Wait for review (typically 24-48 hours)

### Post-Deployment Checklist

**App Store Connect**:
- [ ] All metadata fields filled
- [ ] Screenshots uploaded for all device sizes
- [ ] Privacy policy URL works
- [ ] Terms of use URL works
- [ ] Support URL works
- [ ] In-app purchases configured (if applicable)
- [ ] Subscription terms included in description

**GitHub**:
- [ ] Code pushed to main repository
- [ ] `nowgit.md` updated with all repo URLs
- [ ] `keytext.md` created with App Store metadata
- [ ] `icon.md` created with icon details
- [ ] `capabilities.md` created (if manual steps needed)

**Monitoring**:
- [ ] App Store analytics enabled
- [ ] Crash reporting enabled (Xcode Organizer)
- [ ] User feedback monitoring set up
- [ ] Support email configured

---

## Summary

This document provides a comprehensive guide for developing NavFocus, an ADHD-optimized navigation app for iOS. It covers:

1. **Product Vision**: Clear value proposition and market positioning
2. **Competitive Analysis**: Deep understanding of the competitive landscape
3. **Apple Guidelines**: Compliance with HIG and App Store Review Guidelines
4. **Technical Architecture**: Detailed system design and technology stack
5. **Module Structure**: Organized file structure for maintainability
6. **Implementation Flow**: Step-by-step development process
7. **UI/UX Design**: Detailed design specifications following US trends
8. **Code Generation Rules**: Principles for clean, maintainable code
9. **Testing Standards**: Comprehensive testing and validation criteria
10. **Deployment Checklist**: Complete build and deployment process

**Next Steps**:
1. Follow Phase 1-11 in order
2. Use this document as the single source of truth
3. Update `us.md` as requirements evolve
4. Document all decisions and changes
5. Test thoroughly before App Store submission

**Success Criteria**:
- App builds and runs without errors
- All features work as specified
- App Store submission approved
- Positive user feedback and ratings

---

**Document Version**: 1.0  
**Last Updated**: 2025-04-21  
**Author**: AI Assistant  
**Status**: Ready for Implementation