import SwiftUI
import Foundation
import Combine
import Observation
import GoogleGenerativeAI

struct ContentView: View {
    @State private var gemini: GeminiChatStarterTemplate = GeminiChatStarterTemplate()
    
    var body: some View {
        Spacer()
        VStack {
            Spacer()
            Text("♊︎")
                .font(.largeTitle)
            Spacer()
            Text($gemini.responseText.wrappedValue)
            TextField("Send a message to Gemini...", text: $gemini.promptText)
                .padding()
                .border(.blue, width: 1.0)
                .safeAreaPadding()
                .onSubmit {
                    gemini.prompt(prompt: gemini.promptText)
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
