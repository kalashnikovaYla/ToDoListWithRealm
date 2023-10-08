//
//  ContentView.swift
//  ToDoListWithRealm
//
//  Created by sss on 08.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAddTaskView = false
    @StateObject var realmManager = RealmManager()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TasksView()
                .environmentObject(realmManager)
            
            SmallAddButton()
                .padding()
                .onTapGesture {
                    showAddTaskView = true
                }
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .bottom)
        .background(Color(hue: 0.086,
                          saturation: 0.141,
                          brightness: 0.972)
        )
        .sheet(isPresented: $showAddTaskView) {
            AddTaskView()
                .environmentObject(realmManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
