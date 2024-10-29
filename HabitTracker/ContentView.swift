//
//  ContentView.swift
//  HabitTracker
//
//  Created by Mój Maczek on 24/10/2024.
//
import Foundation
import SwiftUI

struct ContentView: View {
    @State private var activities = Activities()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(activities.items) { activity in
                    NavigationLink {
                        ActivityView(activity: activity, activities: activities)
                    } label: {
                        VStack {
                            Text(activity.name)
                                .font(.title)
                                .fontWeight(.bold)
                            if activity.counter == 0 {
                                Text("It will be the first time!")
                            } else {
                                Text("Last practice: \n\(activity.formattedLastActiveDate)")
                            }
                        }
                    }
                    
                    .listRowSeparator(.hidden)
                    .padding(.horizontal)
                    
                }
                .onDelete(perform: deletItems)
                .foregroundColor(.white)
                .background(.darkMagenta)
                .listRowBackground(Color.darkMagenta)
            }
            
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button() {
                        showingAddActivity = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.title)
                    }
                }
            }

            .sheet(isPresented: $showingAddActivity) {
                AddActivity(activities: activities)
            }
            .navigationTitle("HabitTracker")
            .listStyle(.plain)
            .background(.darkMagenta)
            .preferredColorScheme(.dark)
        }

    }
    
    func deletItems(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
