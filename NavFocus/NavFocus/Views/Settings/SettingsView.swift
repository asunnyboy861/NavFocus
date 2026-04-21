import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
    @State private var showResetConfirmation = false

    var body: some View {
        Form {
            reminderSection
            hapticAndVoiceSection
            transitSection
            aboutSection
        }
        .frame(maxWidth: 720)
        .frame(maxWidth: .infinity)
        .navigationTitle("Settings")
    }

    private var reminderSection: some View {
        Section {
            VStack(alignment: .leading) {
                HStack {
                    Text("Reminder Frequency")
                    Spacer()
                    Text(frequencyLabel)
                        .foregroundStyle(.secondary)
                }
                Slider(value: $viewModel.reminderFrequency, in: 10...120, step: 5) {
                    Text("Frequency")
                }
            }

            VStack(alignment: .leading) {
                HStack {
                    Text("Voice Volume")
                    Spacer()
                    Text("\(Int(viewModel.reminderVolume * 100))%")
                        .foregroundStyle(.secondary)
                }
                Slider(value: $viewModel.reminderVolume, in: 0...1, step: 0.1) {
                    Text("Volume")
                }
            }
        } header: {
            Label("Reminders", systemImage: "bell.fill")
        }
    }

    private var hapticAndVoiceSection: some View {
        Section {
            Toggle("Haptic Feedback", isOn: $viewModel.hapticEnabled)
            Toggle("Voice Navigation", isOn: $viewModel.voiceEnabled)
        } header: {
            Label("Feedback", systemImage: "hand.tap.fill")
        }
    }

    private var transitSection: some View {
        Section {
            Stepper("Alert \(viewModel.transitAlertStops) stops before destination", value: $viewModel.transitAlertStops, in: 1...10)
        } header: {
            Label("Transit", systemImage: "bus.fill")
        }
    }

    private var aboutSection: some View {
        Section {
            NavigationLink {
                ContactSupportView()
            } label: {
                Label("Contact Support", systemImage: "envelope.fill")
            }

            Link(destination: URL(string: "https://asunnyboy861.github.io/NavFocus-support/")!) {
                Label("Support Page", systemImage: "questionmark.circle")
            }

            Link(destination: URL(string: "https://asunnyboy861.github.io/NavFocus-pravicy/")!) {
                Label("Privacy Policy", systemImage: "hand.raised.fill")
            }

            Link(destination: URL(string: "https://asunnyboy861.github.io/NavFocus-terms/")!) {
                Label("Terms of Use", systemImage: "doc.text.fill")
            }

            HStack {
                Text("Version")
                Spacer()
                Text("1.0.0")
                    .foregroundStyle(.secondary)
            }

            Button("Reset All Settings", role: .destructive) {
                showResetConfirmation = true
            }
            .alert("Reset Settings?", isPresented: $showResetConfirmation) {
                Button("Cancel", role: .cancel) {}
                Button("Reset", role: .destructive) {
                    viewModel.resetToDefaults()
                }
            } message: {
                Text("This will restore all settings to their default values.")
            }
        } header: {
            Label("About", systemImage: "info.circle")
        }
    }

    private var frequencyLabel: String {
        if viewModel.reminderFrequency < 60 {
            return "\(Int(viewModel.reminderFrequency)) sec"
        } else {
            let minutes = Int(viewModel.reminderFrequency) / 60
            return "\(minutes) min"
        }
    }
}
