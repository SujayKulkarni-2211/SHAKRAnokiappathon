import AVFoundation
import UIKit

// Ensure this is the only declaration of VideoCapture
class VideoCapture: NSObject {
    static let shared = VideoCapture()  // Singleton

    private var captureSession: AVCaptureSession?
    private var videoOutput: AVCaptureMovieFileOutput?
    private var previewLayer: AVCaptureVideoPreviewLayer?

    // Start video capture and display in the provided view
    func startVideoCapture(in view: UIView) {
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = .high

        // Setup camera
        guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            print("No video device available")
            return
        }

        do {
            let videoInput = try AVCaptureDeviceInput(device: videoDevice)

            // Add input and output to session
            if captureSession?.canAddInput(videoInput) == true {
                captureSession?.addInput(videoInput)
            }

            videoOutput = AVCaptureMovieFileOutput()
            if captureSession?.canAddOutput(videoOutput!) == true {
                captureSession?.addOutput(videoOutput!)
            }

            // Display preview layer
            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            previewLayer?.videoGravity = .resizeAspectFill
            previewLayer?.frame = view.bounds
            view.layer.addSublayer(previewLayer!)

            captureSession?.startRunning()
            print("Video capture started")

        } catch {
            print("Error setting up video input: \(error)")
        }
    }

    func stopVideoCapture() {
        captureSession?.stopRunning()
        previewLayer?.removeFromSuperlayer()
        captureSession = nil
        videoOutput = nil
        previewLayer = nil
        print("Video capture stopped")
    }

    func startRecording(to fileURL: URL) {
        guard let videoOutput = videoOutput else {
            print("Video output not set up")
            return
        }

        videoOutput.startRecording(to: fileURL, recordingDelegate: self)
        print("Recording started")
    }

    func stopRecording() {
        videoOutput?.stopRecording()
        print("Recording stopped")
    }
}

// Handle recording completion
extension VideoCapture: AVCaptureFileOutputRecordingDelegate {
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        if let error = error {
            print("Error recording: \(error.localizedDescription)")
        } else {
            print("Recording finished at: \(outputFileURL.absoluteString)")
        }
    }
}
