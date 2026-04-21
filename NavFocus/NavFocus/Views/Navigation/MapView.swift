import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var viewModel: NavigationViewModel
    @ObservedObject var locationService: LocationService
    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var mapStyle: MapStyle = .standard

    var body: some View {
        ZStack {
            mapContent
            turnInstructionOverlay
            navigationControls
        }
    }

    private var mapContent: some View {
        Map(position: $cameraPosition) {
            UserAnnotation()

            if let destination = viewModel.destinationCoordinate {
                Marker(viewModel.destinationName, coordinate: destination)
                    .tint(.red)
            }

            if let route = viewModel.route {
                MapPolyline(route.polyline)
                    .stroke(.blue, lineWidth: 5)
            }
        }
        .mapStyle(mapStyle)
        .mapControls {
            MapCompass()
            MapUserLocationButton()
            MapScaleView()
        }
    }

    private var turnInstructionOverlay: some View {
        VStack {
            if viewModel.isNavigating, let step = viewModel.currentStep {
                FloatingPanel {
                    TurnInstructionView(step: step, distance: viewModel.distanceToNextTurn)
                }
                .padding(.top, 8)
            }
            Spacer()
        }
    }

    private var navigationControls: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                if viewModel.isNavigating {
                    Button(action: { viewModel.stopNavigation() }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .padding(12)
                            .background(Color.red)
                            .clipShape(Circle())
                    }
                    .padding(.trailing, 16)
                    .padding(.bottom, 16)
                }
            }
        }
    }
}

struct TurnInstructionView: View {
    let step: NavigationStep
    let distance: Double

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: turnIcon)
                .font(.system(size: 28, weight: .bold))
                .foregroundStyle(.blue)
                .frame(width: 44, height: 44)

            VStack(alignment: .leading, spacing: 2) {
                Text(GeometryUtils.formatDistance(distance))
                    .font(.system(size: 20, weight: .bold))
                Text(step.instruction)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }

            Spacer()
        }
        .padding()
    }

    private var turnIcon: String {
        switch step.maneuverType {
        case .straight: return "arrow.up"
        case .left: return "arrow.turn.up.left"
        case .right: return "arrow.turn.up.right"
        case .slightLeft: return "arrow.up.left"
        case .slightRight: return "arrow.up.right"
        case .sharpLeft: return "arrow.uturn.up.left"
        case .sharpRight: return "arrow.uturn.up.right"
        case .uTurn: return "arrow.uturn.up.left"
        case .arrive: return "flag.checkered"
        }
    }
}
