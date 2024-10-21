import SwiftUI

struct AnnotationView: View {
    @State private var points: [CGPoint] = []

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                for point in points {
                    path.addLine(to: point)
                }
            }
            .stroke(Color.red, lineWidth: 3)
            .gesture(DragGesture()
                .onChanged { value in
                    points.append(value.location)
                }
            )
        }
    }
}

