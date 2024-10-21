import SwiftUI

struct GestureControlView: View {
    var body: some View {
        VStack {
            Text("Control Remote Device")
                .font(.title)
                .padding()

            Rectangle()
                .fill(Color.gray)
                .frame(width: 300, height: 500)
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            if value.translation.width > 0 {
                                print("Swipe right detected")
                                RemoteControlService.shared.sendGestureEvent("swipeRight")
                            } else if value.translation.width < 0 {
                                print("Swipe left detected")
                                RemoteControlService.shared.sendGestureEvent("swipeLeft")
                            }
                        }
                )
        }
    }
}

