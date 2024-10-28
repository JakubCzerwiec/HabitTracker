//
//  ActivityView.swift
//  HabitTracker
//
//  Created by Mój Maczek on 25/10/2024.
//
import Foundation
import SwiftUI

struct ActivityView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var activity: Activity
    @State var activities = Activities()
    @State var actualeDate = Date.now
    
    
    var body: some View {
        Text("\(activity.name)")
        Text("\(activity.description)")
        Text("\(activity.counter)")
        Text(activity.formattedLastActiveDate)

        Button("Save") {
            if let indexNum = activities.items.firstIndex(of: activity) {
                var newActivity = activity
                newActivity.counter += 1
                newActivity.lastActive = actualeDate
                activities.items[indexNum] = newActivity
                dismiss()
            }
           
        }
    }
}

#Preview {
    ActivityView(activity: Activities().items[0])
}
