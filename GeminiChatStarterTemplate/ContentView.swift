import SwiftUI
import Foundation
import Combine
import Observation
import GoogleGenerativeAI

struct ContentView: View {
    @State private var gemini: GeminiChatStarterTemplate = GeminiChatStarterTemplate()
    
    let toneBarrierSapphire: Color = Color.init(hue: 206 / 360, saturation: 1, brightness: 1)
    
    
    var body: some View {
        Spacer()
        VStack {
            Spacer()
            ZStack {
                Text("♊︎")
                    .font(.system(size: 244))
                    .scaledToFit()
                    .aspectRatio(1.0, contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.size.width)
                    .clipShape(Rectangle())
                    .foregroundStyle(toneBarrierSapphire.opacity(0.15))
                Spacer()
                Text($gemini.responseText.wrappedValue)
                    .padding()
                    .safeAreaPadding()
                    .foregroundStyle(.primary)
//                    .scaledToFit()
//                    .background(.regularMaterial)
            }
            TextField("Send a message to Gemini...", text: $gemini.promptText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: UIScreen.main.bounds.size.width)
                .safeAreaPadding()
                .onSubmit {
                    gemini.prompt()
                }
            Spacer()
        }
        Spacer()
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
