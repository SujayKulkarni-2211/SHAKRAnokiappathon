import CryptoKit
import Foundation

class SecurityService {
    static let shared = SecurityService()

    func encryptMessage(_ message: String) -> Data {
        let key = SymmetricKey(size: .bits256)
        let data = message.data(using: .utf8)!
        let sealedBox = try! ChaChaPoly.seal(data, using: key)
        return sealedBox.ciphertext
    }

    func decryptMessage(_ encryptedData: Data) -> String {
        // Decryption logic
        return "Decrypted message"
    }
}

