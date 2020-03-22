//
//  Configurator.swift
//  ToDoAppViper
//
//  Created by Никита Гундорин on 22.03.2020.
//  Copyright © 2020 Никита Гундорин. All rights reserved.
//

import Foundation

protocol ConfiguratorProtocol {
    func configure(viewController: TableViewController)
}

class Configurator: ConfiguratorProtocol {
    func configure(viewController: TableViewController) {
        let presenter: PresenterProtocol & InteractorOutputProtocol = Presenter()
        let interactor = Interactor()
        let router = Router()
    
        viewController.presenter = presenter
        viewController.presenter.view = viewController
        viewController.presenter.interactor = interactor
        viewController.presenter.router = router
        viewController.presenter.interactor.presenter = presenter
    }
}
