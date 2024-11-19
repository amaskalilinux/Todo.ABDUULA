//
//  datastore.swift
//  ToDoList
//
//  Created by i mac on 19/11/2024.
//

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
