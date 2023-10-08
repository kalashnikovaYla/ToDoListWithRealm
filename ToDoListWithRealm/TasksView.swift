//
//  TasksView.swift
//  ToDoListWithRealm
//
//  Created by sss on 08.10.2023.
//

import SwiftUI

struct TasksView: View {
    
    @EnvironmentObject var realmManager: RealmManager 
    
    var body: some View {
        VStack {
            Text("My task")
                .font(.title3).bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            List {
                ForEach(realmManager.tasks, id: \.id) { task in
                    if !task.isInvalidated {
                        TaskRow(task: task.title,
                                completed: task.completed)
                        .onTapGesture {
                            realmManager.updateTask(id: task.id,
                                                    completed: !task.completed)
                        }
                        .swipeActions(edge: .trailing,
                                      allowsFullSwipe: true) {
                            Button(role: .destructive) {
                                realmManager.deleteTask(id: task.id)
                            } label: {
                                Text("Delete")
                            }
                        }
                    }
                    
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.red
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
