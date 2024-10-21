import AVFoundation

class ScreenCapture {
    static let shared = ScreenCapture()
    private var captureSession: AVCaptureSession!

    init() {
        setupCaptureSession()
    }

    private func setupCaptureSession() {
        captureSession = AVCaptureSession()
        // Screen input logic
        guard let screenInput = AVCaptureScreenInput(displayID: CGMainDisplayID()) else {
            print("Error: Could not create screen input")
            return
        }
        captureSession.addInput(screenInput)

        let output = AVCaptureVideoDataOutput()
        captureSession.addOutput(output)
    }

    func startCapture() {
        captureSession.startRunning()
        print("Screen capture started")
    }

    func stopCapture() {
        captureSession.stopRunning()
        print("Screen capture stopped")
    }
}

