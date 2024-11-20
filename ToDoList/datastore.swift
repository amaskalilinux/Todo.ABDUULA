//
//  datastore.swift
//  ToDoList
//
//  Created by ABDLLA ALBOOSHI.
//  Udacity CreateApps

import Foundation
import SwiftUI
import Combine

struct Task : Identifiable {
    var id = String()
    var newTask = String()
}

class TaskStore : ObservableObject {
    @Published var tasks = [Task]()
}
