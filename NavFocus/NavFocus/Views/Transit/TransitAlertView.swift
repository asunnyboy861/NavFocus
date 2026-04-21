import SwiftUI

struct TransitAlertView: View {
    @ObservedObject var navigationViewModel: NavigationViewModel
    @ObservedObject var settingsViewModel: SettingsViewModel
    @State private var totalStops: Int = 10
    @State private var currentStop: Int = 0
    @State private var isAlertActive = false

    var body: some View {
        VStack(spacing: 24) {
            headerSection
            stopsCounter
            alertSettings
            Spacer()
        }
        .padding()
        .frame(maxWidth: 720)
        .frame(maxWidth: .infinity)
        .navigationTitle("Transit Alert")
    }

    private var headerSection: some View {
        VStack(spacing: 8) {
            Image(systemName: "bus.fill")
                .font(.system(size: 48))
                .foregroundStyle(.blue)
            Text("Transit Stop Alert")
                .font(.title2.bold())
            Text("Get notified before your stop")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(.top, 20)
    }

    private var stopsCounter: some View {
        VStack(spacing: 16) {
            HStack(spacing: 40) {
                VStack {
                    Text("\(currentStop)")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(.blue)
                    Text("Current")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                VStack {
                    Text("\(totalStops)")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(.orange)
                    Text("Total")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            ProgressRingView(
                progress: totalStops > 0 ? Double(currentStop) / Double(totalStops) : 0,
                lineWidth: 10,
                size: 120,
                color: .blue
            )
            .overlay {
                Text("\(Int(totalStops > 0 ? Double(currentStop) / Double(totalStops) * 100 : 0))%")
                    .font(.title3.bold())
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private var alertSettings: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Alert before stop")
                    .font(.headline)
                Spacer()
                Stepper("\(settingsViewModel.transitAlertStops) stops", value: $settingsViewModel.transitAlertStops, in: 1...10)
                    .labelsHidden()
            }

            HStack {
                Text("Total stops on route")
                    .font(.headline)
                Spacer()
                Stepper("\(totalStops)", value: $totalStops, in: 1...99)
                    .labelsHidden()
            }

            HStack {
                Button("Previous Stop") {
                    if currentStop > 0 { currentStop -= 1 }
                }
                .buttonStyle(.bordered)
                Spacer()
                Button("Next Stop") {
                    if currentStop < totalStops { currentStop += 1 }
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
