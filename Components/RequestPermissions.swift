//
//  RequestPermissions.swift
//  blackout
//
//  Created by Carla on 10.07.24.
//

import SwiftUI

struct RequestPermissions: View {
    @StateObject private var speechRecognizer = SpeechRecognizer()
    
    var body: some View {
        VStack{
            Text("Requesting permissions")
        }
        .onAppear {
                    Task {
                        await speechRecognizer.requestPermissions()
                    }
                }
    }
        
}

#Preview {
    RequestPermissions()
}
