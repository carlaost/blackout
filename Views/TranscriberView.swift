//
//  TranscriberView.swift
//  blackout
//
//  Created by Carla on 27.06.24.
//

import SwiftUI
import SwiftData

struct TranscriberView: View {
    @Binding var showBlackoutView: Bool
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State var voiceLogs: [String] = []
    
    @Query private var sessionLog: [SessionLog]
    @Environment(\.modelContext) private var context
    
    @State private var newSessionLog: SessionLog?
    
    var body: some View {
        VStack {
            
            List(voiceLogs, id: \.self) { log in
                    Text(log)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .multilineTextAlignment(.trailing)
                }
            .listStyle(PlainListStyle())
                
            HStack {
                Spacer()  // Push the text to the right
                Text(speechRecognizer.transcript)
                    .padding()
                    .multilineTextAlignment(.trailing)
            }
            .frame(maxWidth: .infinity)

            HStack{
                Text("Push the square to talk.")
                Spacer()
            }
            
            HStack{
                Spacer()
                Button(action: {
                    // This will not be used, but it needs to be provided for Button
                }) {
                    Text("")
                        .frame(width: 50, height: 50)  // Make the button a square
                        .background(Color.blue)
                        .foregroundColor(.blue)
                        .cornerRadius(8)
                }
                .onLongPressGesture(minimumDuration: 0.1, pressing: { isPressing in
                    if isPressing {
                        print("Start Transcribing button pressed")
                        speechRecognizer.startTranscribing()
                    } else {
                        print("Stop Transcribing button released")
                        voiceLogs.append(speechRecognizer.transcript)
                        print("Append transcript")
                        speechRecognizer.stopTranscribing()
                    }
                }, perform: {
                    // This closure will not be used
                })
            }
            
            
            
            }
            .padding()
            .onAppear {
                print("ContentView appeared")
                newSessionLog = SessionLog(start: .now, end: nil, content: [])
                if newSessionLog != nil {
                    print("New session initiated")
                }

            }
            .onDisappear(){
                if newSessionLog != nil {
                    newSessionLog?.content = voiceLogs
                    newSessionLog?.end = .now
                    context.insert(newSessionLog!)
                    
                    do {
                        try context.save()  // Attempt to save changes to the context
                        print("New session successfully added to the SessionLog model.")
                    } catch {
                        print("Failed to save the new session: \(error.localizedDescription)")
                    }
                }
                
            }
        }
}
    
struct TranscriberPreviews: PreviewProvider {
    static var previews: some View {
        TranscriberView(showBlackoutView: .constant(false))
    }
}
