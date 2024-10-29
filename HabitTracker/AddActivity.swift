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
    
    var activities: Activities
    
    @State private var activityName = ""
    @State private var activityDescription = ""
    
    @FocusState var inputActive: Bool
    
    
    var body: some View {
        VStack {
            Form {
                TextField("Add new", text: $activityName)
                    .focused($inputActive)
                TextField("Put some description", text: $activityDescription, axis: .vertical)
                    .lineLimit(5, reservesSpace: true)
                    .focused($inputActive)


            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Done") {
                        inputActive = false
                    }
                }
            }
            .background(.darkMagenta)
            Button("Save") {
                let item = Activity(name: activityName, description: activityDescription, counter: 0, lastActive: Date.now)
                activities.items.append(item)
                dismiss()
            }
            .padding()
            .font(.title)
            .fontWeight(.bold)
        }
        .background(.darkMagenta)
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    AddActivity(activities: Activities())
}
