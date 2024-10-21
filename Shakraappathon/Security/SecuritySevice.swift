import Foundation
import CryptoKit

class SecurityService {
    static let shared = SecurityService()

    func encryptMessage(_ message: String) -> Data? {
        let key = SymmetricKey(size: .bits256)
        let data = message.data(using: .utf8)!
        do {
            let sealedBox = try ChaChaPoly.seal(data, using: key)
            return sealedBox.combined
        } catch {
            print("Encryption failed: \(error)")
            return nil
        }
    }

    func decryptMessage(_ encryptedData: Data) -> String? {
        do {
            let sealedBox = try ChaChaPoly.SealedBox(combined: encryptedData)
            let key = SymmetricKey(size: .bits256)
            let decryptedData = try ChaChaPoly.open(sealedBox, using: key)
            return String(data: decryptedData, encoding: .utf8)!
        } catch {
            print("Decryption failed: \(error)")
            return nil
        }
    }
}
