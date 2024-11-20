//  Created by ABDLLA ALBOOSHI.
//  Udacity CreateApps

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TodoViewModel()
    @State private var newTodoTitle: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter new todo", text: $newTodoTitle)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    viewModel.add(title: newTodoTitle)
                    newTodoTitle = ""
                }) {
                    Text("Add Todo")
                }
                .padding()

                List {
                    ForEach(viewModel.todos) { todo in
                        HStack {
                            Text(todo.title)
                            Spacer()
                            if todo.isCompleted {
                                Text("✅")
                            } else {
                                Text("❌")
                            }
                        }
                        .onTapGesture {
                            if let index = viewModel.todos.firstIndex(where: { $0.id == todo.id }) {
                                viewModel.toggleCompletion(at: index)
                            }
                        }
                    }
                    .onDelete(perform: { indexSet in
                        indexSet.forEach { index in
                            viewModel.delete(at: index)
                        }
                    })
                }
            }
            .navigationTitle("To-Do List")
        }
    }
}
