//
//  SetupView.swift
//  blackout
//
//  Created by Carla on 10.07.24.
//

import SwiftUI

struct SetupView: View {
    @Binding var showSetupView: Bool
    @State private var view = 0
    let subviews: [AnyView] = [
        AnyView(GAInstructions()),
        AnyView(RequestPermissions())
    ]
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Text("Let's get started")
                    .font(.title2)
                    .bold()
            }
            subviews[view]
            Spacer()
            Button(action: {
                view = (view + 1) % subviews.count
            }) {
                Text("Next")
            }
            Button(action: {
                showSetupView = false
            }) {
                Text("Done")
            }
            .padding(.top)
        }
        .padding()
    }
}

#Preview {
    SetupView(showSetupView: .constant(false))
}
