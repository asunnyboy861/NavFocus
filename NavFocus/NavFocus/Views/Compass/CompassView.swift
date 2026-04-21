import SwiftUI

struct CompassView: View {
    @ObservedObject var compassViewModel: CompassViewModel
    @ObservedObject var navigationViewModel: NavigationViewModel
    @ObservedObject var locationService: LocationService

    var body: some View {
        VStack(spacing: 24) {
            headingDisplay
            compassRing
            if navigationViewModel.isNavigating {
                nextTurnInfo
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: 720)
        .frame(maxWidth: .infinity)
        .navigationTitle("Compass")
        .onAppear {
            updateCompassWithNavigation()
        }
    }

    private var headingDisplay: some View {
        VStack(spacing: 4) {
            Text(compassViewModel.compassDirection)
                .font(.system(size: 48, weight: .bold))
            Text("\(Int(compassViewModel.heading))°")
                .font(.title3)
                .foregroundStyle(.secondary)
        }
    }

    private var compassRing: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), lineWidth: 3)
                .frame(width: 220, height: 220)

            ForEach(0..<360, id: \.self) { degree in
                if degree % 90 == 0 {
                    let label = ["N", "E", "S", "W"][degree / 90]
                    Text(label)
                        .font(.caption.bold())
                        .foregroundStyle(degree == 0 ? .red : .secondary)
                        .offset(y: -105)
                        .rotationEffect(.degrees(Double(degree)))
                } else if degree % 30 == 0 {
                    Rectangle()
                        .fill(Color.secondary)
                        .frame(width: 1, height: 8)
                        .offset(y: -100)
                        .rotationEffect(.degrees(Double(degree)))
                }
            }
            .rotationEffect(.degrees(-compassViewModel.heading))

            if navigationViewModel.isNavigating {
                directionArrow
            }

            Circle()
                .fill(Color.blue)
                .frame(width: 10, height: 10)
        }
        .frame(width: 220, height: 220)
    }

    private var directionArrow: some View {
        Image(systemName: "location.north.fill")
            .font(.system(size: 24))
            .foregroundStyle(.blue)
            .offset(y: -60)
            .rotationEffect(.degrees(compassViewModel.directionToNextTurn - compassViewModel.heading))
    }

    private var nextTurnInfo: some View {
        VStack(spacing: 8) {
            Text(GeometryUtils.formatDistance(compassViewModel.distanceToNextTurn))
                .font(.system(size: 32, weight: .bold))
                .foregroundStyle(.blue)
            Text(compassViewModel.nextTurnInstruction)
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }

    private func updateCompassWithNavigation() {
        compassViewModel.updateWithNavigationStep(
            navigationViewModel.currentStep,
            currentLocation: locationService.location
        )
    }
}
