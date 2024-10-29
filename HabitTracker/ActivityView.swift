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
        VStack {
            Spacer()
            VStack {
                Text("\(activity.name)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("\(activity.description)")
                Text("You practiced: \(activity.counter) times")
                Spacer()
                if activity.counter == 0 {
                    Text("It's the first time!")
                } else {
                    Text("Last time: \n\(activity.formattedLastActiveDate)")
                }
            }
            .frame(height: 300)
            .padding()
            Spacer()
            Button("Submit new practice") {
                if let indexNum = activities.items.firstIndex(of: activity) {
                    var newActivity = activity
                    newActivity.counter += 1
                    newActivity.lastActive = actualeDate
                    activities.items[indexNum] = newActivity
                    dismiss()
                }
                
            }
        }
        .padding()
        .fontWeight(.bold)
        .frame(maxWidth: .infinity)
        .background(.darkMagenta)
        .preferredColorScheme(.dark)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
                .foregroundColor(.red)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ActivityView(activity: Activities().items[0])
}
