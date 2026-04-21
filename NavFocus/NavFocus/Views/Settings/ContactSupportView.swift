import SwiftUI

struct ContactSupportView: View {
    @State private var selectedSubject: FeedbackSubject = .general
    @State private var name = ""
    @State private var email = ""
    @State private var message = ""
    @State private var isSubmitting = false
    @State private var showSuccess = false
    @State private var showError = false
    @State private var errorMessage = ""

    private let feedbackURL = URL(string: "https://feedback-board.iocompile67692.workers.dev/api/feedback")!

    enum FeedbackSubject: String, CaseIterable {
        case general = "General Feedback"
        case bug = "Bug Report"
        case feature = "Feature Request"
        case navigation = "Navigation Issue"
        case accessibility = "Accessibility"
        case other = "Other"

        var icon: String {
            switch self {
            case .general: return "message.fill"
            case .bug: return "ladybug"
            case .feature: return "lightbulb.fill"
            case .navigation: return "location.fill"
            case .accessibility: return "accessibility"
            case .other: return "ellipsis.circle.fill"
            }
        }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                subjectSection
                nameField
                emailField
                messageField
                submitButton
            }
            .padding()
            .frame(maxWidth: 600)
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("Contact Support")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank You!", isPresented: $showSuccess) {
            Button("OK") { resetForm() }
        } message: {
            Text("Your feedback has been submitted successfully. We will get back to you soon.")
        }
        .alert("Submission Failed", isPresented: $showError) {
            Button("OK") {}
        } message: {
            Text(errorMessage)
        }
    }

    private var subjectSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Subject")
                .font(.headline)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(FeedbackSubject.allCases, id: \.self) { subject in
                        subjectChip(subject)
                    }
                }
            }
        }
    }

    private func subjectChip(_ subject: FeedbackSubject) -> some View {
        Button(action: { selectedSubject = subject }) {
            HStack(spacing: 6) {
                Image(systemName: subject.icon)
                    .font(.caption)
                Text(subject.rawValue)
                    .font(.subheadline)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(selectedSubject == subject ? Color.blue : Color(.systemGray5))
            .foregroundStyle(selectedSubject == subject ? .white : .primary)
            .clipShape(Capsule())
        }
    }

    private var nameField: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Name")
                .font(.headline)
            TextField("Your name", text: $name)
                .textFieldStyle(.roundedBorder)
        }
    }

    private var emailField: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Email")
                .font(.headline)
            TextField("your@email.com", text: $email)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
                .autocorrectionDisabled()
        }
    }

    private var messageField: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Message")
                .font(.headline)
            TextEditor(text: $message)
                .frame(minHeight: 120)
                .scrollContentBackground(.hidden)
                .padding(8)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                )
        }
    }

    private var submitButton: some View {
        Button(action: submitFeedback) {
            HStack {
                if isSubmitting {
                    ProgressView()
                        .tint(.white)
                }
                Text(isSubmitting ? "Submitting..." : "Submit Feedback")
                    .font(.headline)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(isFormValid ? Color.blue : Color.gray)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .disabled(!isFormValid || isSubmitting)
    }

    private var isFormValid: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty &&
        email.contains("@") &&
        !message.trimmingCharacters(in: .whitespaces).isEmpty
    }

    private func submitFeedback() {
        isSubmitting = true

        var request = URLRequest(url: feedbackURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: String] = [
            "name": name.trimmingCharacters(in: .whitespaces),
            "email": email.trimmingCharacters(in: .whitespaces),
            "subject": selectedSubject.rawValue,
            "message": message.trimmingCharacters(in: .whitespaces),
            "app_name": "NavFocus"
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { _, response, error in
            Task { @MainActor in
                isSubmitting = false
                if let error = error {
                    errorMessage = error.localizedDescription
                    showError = true
                } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    showSuccess = true
                } else {
                    errorMessage = "Server error. Please try again later."
                    showError = true
                }
            }
        }.resume()
    }

    private func resetForm() {
        selectedSubject = .general
        name = ""
        email = ""
        message = ""
    }
}
