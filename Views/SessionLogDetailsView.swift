//
//  SessionLogDetailsView.swift
//  blackout
//
//  Created by Carla on 09.07.24.
//

import SwiftUI

struct SessionLogDetailsView: View {
    var session: SessionLog
    
    var body: some View {
        VStack {
            HStack {
                Text(session.start.formatted())
                if let endDate = session.end {
                    Text(endDate.formatted())
                } else {
                    Text("No End Date")
                }
            }
            if session.content.isEmpty {
                Text("No logs were recorded during this session.")
            } else {
                List(session.content, id: \.self) { content in
                    Text(content)                        }
            }
        }
        .padding()
    }
}

#Preview {
    SessionLogDetailsView(session: SessionLog(start: Date(), end: nil, content: ["Sample content"]))
}
