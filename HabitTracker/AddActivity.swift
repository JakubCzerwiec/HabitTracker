//
//  AddActivity.swift
//  HabitTracker
//
//  Created by Mój Maczek on 25/10/2024.
//
import Foundation
import SwiftUI

struct AddActivity: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var activityName = ""
    @State private var activityDescription = ""
    
    var activities: Activities
    
    var body: some View {
        Form {
            TextField("Add new", text: $activityName)
            TextField("Put some description", text: $activityDescription)
            Button("Save") {
                let item = Activity(name: activityName, description: activityDescription, counter: 0, lastActive: Date.now)
                activities.items.append(item)
                dismiss()
            }
        }
    }
}

#Preview {
    AddActivity(activities: Activities())
}
