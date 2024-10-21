import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("SHAKRA Remote Collaboration")
                .font(.largeTitle)
                .padding()

            Button(action: {
                RemoteControlService.shared.startSession()
            }) {
                Text("Start Remote Control Session")
                    .font(.title)
                    .padding()
            }

            Button(action: {
                ScreenCapture.shared.startCapture()
            }) {
                Text("Share Screen")
                    .font(.title)
                    .padding()
            }
        }
    }
}
