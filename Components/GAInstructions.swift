//
//  GAInstructions.swift
//  blackout
//
//  Created by Carla on 10.07.24.
//

import SwiftUI

struct GAInstructions: View {
    var body: some View {
        VStack{
            HStack{
                Text("To use Blackout, you need to setup Guided Access. This is how you will initiate a blackout session.")
                Spacer()
            }
            .padding(.top)
            VStack{
                HStack{
                    Text("1. Go to Settings > Accessibility, then turn on Guided Access.")
                    Spacer()
                }
                HStack{
                    Text("2. Tap Passcode Settings, then tap Set Guided Access Passcode.")
                    Spacer()
                }
                HStack{
                    Text("3. Enter a passcode, then re-enter it.")
                    Spacer()
                }
                HStack{
                    Text("4. Enabled FaceID or TouchID to end a Guided Access Session.")
                    Spacer()
                }
            }
            .padding(.top)
        }
            
    }

}


#Preview {
    GAInstructions()
}
