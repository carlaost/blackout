//
//  MainView.swift
//  blackout
//
//  Created by Carla on 09.07.24.
//

import SwiftUI

struct MainView: View {
    @State private var isFirstLaunch: Bool = false
    @State private var showSetupView = false
    @StateObject private var guidedAccessObserver = GuidedAccessObserver()
    
    var body: some View {
            Group {
                if showSetupView {
                    SetupView(showSetupView: $showSetupView)
                } else {
                    HomeView()
                        .environmentObject(guidedAccessObserver) // Provide the observer to HomeView
                        .modelContainer(for: SessionLog.self) // Provide the model container to HomeView
                }
            }
            .onAppear {
                checkFirstLaunch() // Check if it's the first launch when the view appears
            }
        }
    
    private func checkFirstLaunch() {
        let userDefaults = UserDefaults.standard
        if userDefaults.bool(forKey: "hasLaunchedBefore") == false {
            isFirstLaunch = true
            showSetupView = true
            userDefaults.set(true, forKey: "hasLaunchedBefore")
            userDefaults.synchronize()
        } else {
            isFirstLaunch = false
        }
    }
}




#Preview {
    MainView()
}
