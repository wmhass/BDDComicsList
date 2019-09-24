//
//  ComicsListModuleConnector.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-21.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class ComicsListModuleConnector {
    func connectDependencies(comicsListViewController: ComicsListViewController) {
        
        // Data Layer
        let httpDataLoader = HTTPDataLoader()
        let marvelAPIURLBuilder = MarvelAPIURLBuilder(apiKeys: MarvelAPICredentials.defaultKeys)
        let remoteData = ComicsListRemoteData(marvelAPIURLBuilder: marvelAPIURLBuilder, httpDataLoader: httpDataLoader)
        let dataGateway = ComicsListDataGateway(remoteData: remoteData)
        
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
