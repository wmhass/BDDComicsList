//
//  ComicsListModuleDependencies.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-27.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class ComicsListModuleDependencies {
    func injectDependencies<T>(comicsListViewController: T, dataGateway: ComicsListDataGatewayLogic) where T: UIViewController, T:ComicsListViewConnectable, T:ComicsListDisplayLogic {
        // Business Logic
        let interactor = ComicsListInteractor(dataGateway: dataGateway)
        
        // Presentation layer
        let router = ComicsListRouter()
        let presenter = ComicsListPresenter(router: router, interactor: interactor)
        
        
        // Dependency Injection
        router.viewController = comicsListViewController
        comicsListViewController.eventHandler = presenter
        comicsListViewController.dataSource = presenter
        presenter.view = comicsListViewController
        interactor.presentation = presenter
    }
}
