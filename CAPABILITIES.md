# NavFocus - Xcode Capabilities Configuration

## Manual Configuration Required

The following capabilities need to be manually configured in Xcode since they cannot be set via xcodeproj gem:

### Steps to Configure:
1. Open NavFocus.xcodeproj in Xcode
2. Select the NavFocus target
3. Go to "Signing & Capabilities" tab
4. Click "+ Capability" to add each one

### Required Capabilities:

#### 1. Location Services (Already configured via Info.plist)
- NSLocationWhenInUseUsageDescription: "NavFocus needs your location to provide turn-by-turn navigation and ADHD-optimized reminders."
- NSLocationAlwaysAndWhenInUseUsageDescription: "NavFocus needs your location to provide navigation reminders even when the app is in the background."
- Status: CONFIGURED

#### 2. Maps (Already configured - MapKit is linked)
- MapKit framework is used for mapping and routing
- Status: CONFIGURED

#### 3. Background Modes (NEEDS MANUAL CONFIG)
- Click "+ Capability" -> "Background Modes"
- Enable: "Location updates"
- This allows the app to continue providing navigation reminders when in the background
- Status: NEEDS MANUAL CONFIGURATION

#### 4. Push Notifications (NEEDS MANUAL CONFIG)
- Click "+ Capability" -> "Push Notifications"
- Required for local notification reminders
- Status: NEEDS MANUAL CONFIGURATION

### Info.plist Keys Already Configured:
- NSLocationWhenInUseUsageDescription
- NSLocationAlwaysAndWhenInUseUsageDescription
- TARGETED_DEVICE_FAMILY = 1,2 (iPhone + iPad)
- IPHONEOS_DEPLOYMENT_TARGET = 17.0
- PRODUCT_BUNDLE_IDENTIFIER = com.zzoutuo.NavFocus

### Network Access:
- The app needs network access for:
  1. MapKit route calculation and search
  2. Contact Support feedback submission (POST to https://feedback-board.iocompile67692.workers.dev/api/feedback)
- iOS apps have network access by default (no special capability needed)
- No App Transport Security exceptions needed (all URLs use HTTPS)

### App Store Connect Configuration:
- Bundle ID: com.zzoutuo.NavFocus
- Support URL: https://asunnyboy861.github.io/NavFocus-support/
- Privacy Policy URL: https://asunnyboy861.github.io/NavFocus-pravicy/
- Terms of Use URL: https://asunnyboy861.github.io/NavFocus-terms/
- Contact Email: iocompile67692@gmail.com