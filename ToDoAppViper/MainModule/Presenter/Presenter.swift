//
//  Presenter.swift
//  ToDoAppViper
//
//  Created by Никита Гундорин on 22.03.2020.
//  Copyright © 2020 Никита Гундорин. All rights reserved.
//

import Foundation
import RealmSwift

protocol PresenterProtocol: class {
    var router: RouterProtocol! { get set }
    var interactor: InteractorInputProtocol! { get set }
    var view: TableViewProtocol! { get set }
    
    func viewDidLoad()
    func removeTask(task: ToDoTask)
    func addTask(toDoTaskTitle: String)
    func toggleTaskCompleted(task: ToDoTask)
}

class Presenter: PresenterProtocol, InteractorOutputProtocol {
    func removeTask(task: ToDoTask) {
        interactor.removeTask(task: task)
    }
    
    func addTask(toDoTaskTitle: String) {
        interactor.addTask(toDoTaskTitle: toDoTaskTitle)
    }
    
    func toggleTaskCompleted(task: ToDoTask) {
        interactor.toggleTaskCompleted(task: task)
    }
    
    weak var view: TableViewProtocol!
    var interactor: InteractorInputProtocol!
    var router: RouterProtocol!
    
    func viewDidLoad() {
        interactor.getTasks()
    }
    
    func tasksDidRevieve(tasks: Results<ToDoTask>) {
        view.showTasks(tasks: tasks)
    }
}
