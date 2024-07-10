//
//  blackoutApp.swift
//  blackout
//
//  Created by Carla on 26.06.24.
//

import SwiftUI
import SwiftData
import Combine


@main
struct blackoutApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}


class GuidedAccessObserver: ObservableObject {
    @Published var isGuidedAccessEnabled: Bool = UIAccessibility.isGuidedAccessEnabled
    @Published var showBlackoutView: Bool = UIAccessibility.isGuidedAccessEnabled
    
    private var cancellable: AnyCancellable?

    init() {
        self.cancellable = NotificationCenter.default.publisher(for: UIAccessibility.guidedAccessStatusDidChangeNotification)
            .sink { [weak self] _ in
                let isEnabled = UIAccessibility.isGuidedAccessEnabled
                self?.isGuidedAccessEnabled = isEnabled
                self?.showBlackoutView = isEnabled
                print("Guided Access is now \(isEnabled ? "enabled" : "disabled")")
            }
    }
}
