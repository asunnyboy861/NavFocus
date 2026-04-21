import Foundation
import UIKit

@MainActor
class HapticService: ObservableObject {
    static let shared = HapticService()

    private let notificationGenerator = UINotificationFeedbackGenerator()
    private let impactGenerator = UIImpactFeedbackGenerator(style: .medium)
    private let selectionGenerator = UISelectionFeedbackGenerator()

    private init() {}

    func prepare() {
        notificationGenerator.prepare()
        impactGenerator.prepare()
        selectionGenerator.prepare()
    }

    func playTurnLeft() {
        impactGenerator.impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        }
    }

    func playTurnRight() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        }
    }

    func playArrival() {
        notificationGenerator.notificationOccurred(.success)
    }

    func playTransitAlert() {
        for i in 0..<3 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.2) {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
        }
    }

    func playWarning() {
        notificationGenerator.notificationOccurred(.warning)
    }
}
