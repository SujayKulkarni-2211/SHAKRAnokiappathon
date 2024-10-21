import Foundation

class FileSharingService {
    static let shared = FileSharingService()

    func sendFile(_ fileURL: URL) {
        // Logic to send the file
        print("Sending file: \(fileURL.lastPathComponent)")
    }

    func receiveFile() {
        // Logic to receive file
    }
}

