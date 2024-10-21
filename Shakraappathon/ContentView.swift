import SwiftUI

struct ContentView: View {
    @State private var recording = false
    @State private var videoURL: URL?

    var body: some View {
        VStack {
            // This UIView will display the video preview layer
            VideoPreviewView()

            Button(action: {
                if !recording {
                    // Start video capture and recording
                    let tempURL = FileManager.default.temporaryDirectory.appendingPathComponent("video.mov")
                    videoURL = tempURL
                    VideoCapture.shared.startRecording(to: tempURL)
                } else {
                    // Stop recording
                    VideoCapture.shared.stopRecording()
                }
                recording.toggle()
            }) {
                Text(recording ? "Stop Recording" : "Start Recording")
                    .font(.title)
                    .padding()
            }

            if let videoURL = videoURL {
                Text("Video saved to \(videoURL.absoluteString)")
            }
        }
    }
}

// Custom SwiftUI view for displaying the video feed
struct VideoPreviewView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        // Start video capture in this view
        VideoCapture.shared.startVideoCapture(in: view)
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // No updates needed for now
    }
}
