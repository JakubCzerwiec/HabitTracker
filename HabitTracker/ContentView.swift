//
//  ContentView.swift
//  HabitTracker
//
//  Created by Mój Maczek on 24/10/2024.
//
import Foundation
import SwiftUI

struct Activity: Identifiable, Codable, Equatable, Hashable {
    var id = UUID()
    let name: String
    let description: String
    var counter: Int
    var lastActive: Date?
    
    var formattedLastActiveDate: String {
        lastActive?.formatted(date: .abbreviated, time: .standard) ?? "It's my first time."
    }
}

@Observable
class Activities {
    var items = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}


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
                        Text(activity.name)
                        Text("\(activity.counter)")
                    }
                }
                .onDelete(perform: deletItems)

                Button("Add new Activity") {
                    showingAddActivity = true
                }
                .sheet(isPresented: $showingAddActivity) {
                    AddActivity(activities: activities)
                }
            }
        }
        Button("me") {
            print(activities.items)
        }
    }
    
    func deletItems(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
