//
//  BlackoutView.swift
//  blackout
//
//  Created by Carla on 26.06.24.
//

import SwiftUI

struct BlackoutView: View {
    @Binding var showBlackoutView: Bool
    @State private var voiceLogs: [VoiceLog] = []
    @State private var newVoiceLogContent = ""
    @State private var isRecording = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    showBlackoutView = false
                }) {
                    Text("Exit")
                }
            }
            Spacer()
            Circle()
                .frame(width: 100, height: 100)
                .padding(.bottom, 100)
    
            TextField("say something...", text: $newVoiceLogContent, onCommit: {
                addVoiceLog()
            })
            .padding()
            .background(Color.white)
            .cornerRadius(100)
            .foregroundColor(.black)
            ForEach(voiceLogs) { log in
                Text(log.content)
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .foregroundColor(Color.white)

    }
    
    
    
    func addVoiceLog() {
        guard !newVoiceLogContent.isEmpty else { return }
        let newLog = VoiceLog(id: UUID(), content: newVoiceLogContent)
        voiceLogs.append(newLog)
        newVoiceLogContent = ""
    }
}

struct BlackoutView_Previews: PreviewProvider {
    static var previews: some View {
        BlackoutView(showBlackoutView: .constant(false))
    }
}
