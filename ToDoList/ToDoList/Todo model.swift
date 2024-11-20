//  Todo model.swift
//  ToDoList
//
//  Created by ABDLLA ALBOOSHI.
//  Udacity CreateApps


import Foundation

struct Todo: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
}
