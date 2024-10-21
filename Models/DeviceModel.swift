import Foundation

struct DeviceModel: Identifiable {
    let id = UUID()
    var name: String
    var type: String
    var status: DeviceStatus
    var isOnline: Bool
}

enum DeviceStatus {
    case active
    case inactive
    case busy
}

