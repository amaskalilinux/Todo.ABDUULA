//
//  ContentView.swift
//  ToDoList
//
//  Created by abdulla alblooshi on 19/11/2024.
//  I have try this way i hope its work will :)

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newnewTask: String = ""
    var searchBar : some View {
        HStack{
            TextField("Insert New Task",text:
                        self.$newnewTask)
            Button(action:  self.addnewnewTask,
                   label:{Text("Add New")})
            
        }
    }
    
    func addnewnewTask(){
        taskStore.tasks
            .append(Task(id:String(taskStore
                .tasks.count +
                                   1),newTask:newnewTask))
        self.newnewTask = ""
    }
    
    
    var body: some View {
        NavigationView {
            VStack{
                searchBar.padding()
                List{
                    
                    ForEach(self.taskStore
                        .tasks){
                            
                            task in
                            Text(task.newTask)
                        }.onMove(perform: self.move)
                        .onDelete(perform: self.delete)
                }.navigationTitle("To Do List")
            }.navigationBarItems(trailing:
                                    EditButton())
        }
    }
    
    func move (from source : IndexSet, to
               destination : Int){
        taskStore.tasks.move(fromOffsets: source,
                             toOffset: destination)
    }
    func delete (at offsets : IndexSet){
        taskStore.tasks.remove(atOffsets:
                                offsets)
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}