//
//  Interactor.swift
//  ToDoAppViper
//
//  Created by Никита Гундорин on 22.03.2020.
//  Copyright © 2020 Никита Гундорин. All rights reserved.
//

import Foundation
import RealmSwift

protocol InteractorInputProtocol {
    var presenter: InteractorOutputProtocol! { get set }
    func getTasks()
    func removeTask(task: ToDoTask)
    func addTask(toDoTaskTitle: String)
    func toggleTaskCompleted(task: ToDoTask)
}

protocol InteractorOutputProtocol: class {
    func tasksDidRevieve(tasks: Results<ToDoTask>)
}

class Interactor: InteractorInputProtocol {
    func removeTask(task: ToDoTask) {
        Persistance.shared.removeTask(toDoTask: task)
    }
    
    func addTask(toDoTaskTitle: String) {
        Persistance.shared.createTask(title: toDoTaskTitle)
    }
    
    func toggleTaskCompleted(task: ToDoTask) {
        Persistance.shared.toggleTaskCompleted(toDoTask: task)
    }
    
    weak var presenter: InteractorOutputProtocol!
    
    func getTasks() {
        let tasks = Persistance.shared.getTasks()
        self.presenter.tasksDidRevieve(tasks: tasks)
    }
}
