//
//  ContentView.swift
//  SwiftDataTest
//
//  Created by 刘弨 on 2024/6/27.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var workoutList: [WorkoutList]

    var body: some View {
        VStack{
            Text("This is a test demo")
        }
    }
}

//#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}
