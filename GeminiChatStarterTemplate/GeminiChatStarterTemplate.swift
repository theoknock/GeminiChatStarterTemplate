import SwiftUI
import Foundation
import Combine
import Observation
import GoogleGenerativeAI

@Observable class GeminiChatStarterTemplate {
    var responseText: String = String()
    var promptText: String = String()
    
    let model = GenerativeModel(
        name: "gemini-1.5-flash",
        apiKey: "AIzaSyBUDbB1hrpty5uSVKdlzKS2wwbShRNZNAE",
        generationConfig: GenerationConfig(
            temperature: 1,
            topP: 0.95,
            topK: 64,
            maxOutputTokens: 8192,
            responseMIMEType: "text/plain"
        )
    )

    func prompt(prompt: String) -> () {
        Task {
            print(#function)
            do {
                let chat = model.startChat(history: [
                    
                ])
                let response = try await chat.sendMessage(promptText)
                print(response.text ?? "No response received")
                responseText = (response.text ?? "No response received")
            } catch {
                print(error)
            }
        }
    }
}
