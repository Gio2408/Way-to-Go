import SwiftUI
import SpriteKit

struct HomeSceneView: View {
    @Binding var levelScene: Int  // Control for switching to the LevelScene
    @State private var isVisible: Bool = false  // State to control fade-in animation

    var scene: HomeScene {
        let scene = HomeScene(fileNamed: "HomeScene")!
        scene.scaleMode = .aspectFill
        scene.onCarButtonTapped = {
            withAnimation(.easeInOut(duration: 0.5)) {
                levelScene = 1  // Change to LevelScene on button tap with animation
            }
        }
        return scene
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            SpriteView(scene: scene)
                .ignoresSafeArea()
                .opacity(isVisible ? 1 : 0)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isVisible = true
                    }
                }
            Text("Select Level")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding([.top], 5)
                .padding([.leading, .trailing], 16)
        }
    }
}

struct HomeSceneView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSceneView(levelScene: .constant(0))
    }
}
