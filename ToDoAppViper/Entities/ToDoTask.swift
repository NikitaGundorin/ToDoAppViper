//
//  ToDoTask.swift
//  ToDoAppViper
//
//  Created by Никита Гундорин on 22.03.2020.
//  Copyright © 2020 Никита Гундорин. All rights reserved.
//

import Foundation
import RealmSwift

class ToDoTask: Object {
    @objc dynamic var title = ""
    @objc dynamic var isCompleted = false
}
