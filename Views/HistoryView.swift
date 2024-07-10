//
//  HistoryView.swift
//  blackout
//
//  Created by Carla on 09.07.24.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    @Binding var showHistoryView: Bool
    
    @Query private var sessionLogs: [SessionLog]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack{
            HStack {
                Button(action: {
                    showHistoryView = false
                }) {
                    Text("Exit")
                }
                Spacer()
            }
            Text("Session History")
                .font(.title)
            NavigationStack {
                List(sessionLogs.sorted(by: { $0.start > $1.start })) { session in
                    NavigationLink(destination: SessionLogDetailsView(session: session)) {
                        Text(session.start.formatted())
                    }
                }
                .navigationDestination(for: SessionLog.self) { log in
                    SessionLogDetailsView(session: log)
                        }
                }
        }
        .padding()
    }
}

#Preview {
    HistoryView(showHistoryView: .constant(false))
}
