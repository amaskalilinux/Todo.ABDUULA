//
//  ViewModel.swift
//  ToDoList
//
//  Created by ABDLLA ALBOOSHI.
//  Udacity CreateApps


import Combine

class TodoViewModel: ObservableObject {
    @Published var todos: [Todo] = []

    func add(title: String) {
        let newTodo = Todo(title: title)
        todos.append(newTodo)
    }

    func toggleCompletion(at index: Int) {
        todos[index].isCompleted.toggle()
    }

    func delete(at index: Int) {
        todos.remove(at: index)
    }
}
