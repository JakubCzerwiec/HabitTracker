//
//  Activity.swift
//  HabitTracker
//
//  Created by Mój Maczek on 24/10/2024.
//

import Foundation

struct Activity: Identifiable, Codable, Equatable, Hashable {
    var id = UUID()
    let name: String
    let description: String
    var counter: Int
    var lastActive: Date?
    
    var formattedLastActiveDate: String {
        lastActive?.formatted(date: .abbreviated, time: .shortened) ?? "It's my first time."
    }
}
