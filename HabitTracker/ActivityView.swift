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
    var activities = Activities()
    
    
    var body: some View {
        Text("\(activity.name)")
        Text("\(activity.description)")
        Text("\(activity.counter)")

        Button("Save") {
            if let indexNum = activities.items.firstIndex(of: activity) {
                var newActivity = activity
                newActivity.counter += 1
                activities.items[indexNum] = newActivity
                print(activities.items)
                dismiss()
            }
           
        }
    }
}

#Preview {
    ActivityView(activity: Activities().items[0])
}
