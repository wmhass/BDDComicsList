//
//  ComicsListModuleDependencies.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-27.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

struct ComicsListModuleDependenciesContainer {
    let dataGateway: ComicsListDataGatewayLogic
    let router: ComicsListRoutingLogic
}

final class ComicsListModuleDependencies {
    func injectDependencies<T>(comicsListViewController: T,
                               dependencyContainer: ComicsListModuleDependenciesContainer) where T: UIViewController, T:ComicsListViewConnectable, T:ComicsListDisplayLogic {
        // Business Logic
        let interactor = ComicsListInteractor(dataGateway: dependencyContainer.dataGateway)
        
        // Presentation layer
        let presenter = ComicsListPresenter(router: dependencyContainer.router, interactor: interactor)
        

        // Dependency Injection
        comicsListViewController.eventHandler = presenter
        comicsListViewController.dataSource = presenter
        presenter.view = comicsListViewController
        interactor.presentation = presenter
    }
}
