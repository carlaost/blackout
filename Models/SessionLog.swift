//
//  SessionLogs.swift
//  blackout
//
//  Created by Carla on 09.07.24.
//

import Foundation
import SwiftData

@Model
class SessionLog {
    let id: UUID
    var start: Date
    var end: Date?
    var content: [String]

    init(start: Date, end: Date?, content: [String]) {
        self.id = UUID()
        self.start = start
        self.end = end
        self.content = content
    }
}
