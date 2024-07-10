//
//  GASetupView.swift
//  blackout
//
//  Created by Carla on 09.07.24.
//

import SwiftUI

struct HelpView: View {
    @Binding var showHelpView: Bool
    
    var body: some View {
        VStack{
            HStack{
                Text("Troubleshooting")
                    .font(.title2)
                    .bold()
                Spacer()
            }
            GAInstructions()
            Button(action: {
                showHelpView = false
            }) {
                Text("Done")
            }
            .padding(.top)
        }
        .padding()
    }
}

#Preview {
    HelpView(showHelpView: .constant(false))
}
