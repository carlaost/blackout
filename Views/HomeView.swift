//
//  ContentView.swift
//  blackout
//
//  Created by Carla on 26.06.24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @State private var showBlackoutView = false
    @State private var showHistoryView = false
    @State private var showHelpView = false
    
    @EnvironmentObject var guidedAccessObserver: GuidedAccessObserver
    
    
    
    var body: some View {
        VStack{
            Button(action: {
                showHelpView = true
            }) {
                Text("Help")
            }
            .fullScreenCover(isPresented: $showHelpView) {
                HelpView(showHelpView: $showHelpView)
            }
            
            Text("Triple-click the Lock button to initiate blackout.")
                .padding(.top)
                .padding(.bottom)
            
            Button(action: {
                showHistoryView = true
            }) {
                Text("View History")
            }
            .fullScreenCover(isPresented: $showHistoryView) {
                HistoryView(showHistoryView: $showHistoryView)
            }
        }
        
        .fullScreenCover(isPresented: $guidedAccessObserver.showBlackoutView) {
                        TranscriberView(showBlackoutView: $guidedAccessObserver.showBlackoutView)
                            .modelContainer(for: SessionLog.self)
        }
    }
}

#Preview {
    HomeView()
        .modelContainer(for: SessionLog.self, inMemory: false)
}
