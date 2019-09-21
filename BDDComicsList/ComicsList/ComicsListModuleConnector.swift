//
//  ComicsListModuleConnector.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-21.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class ComicsListModuleConnector {
    func connect(window: UIWindow, comicsListViewController: ComicsListViewController) {
        
        // Data Layer
        let httpDataLoader = HTTPDataLoader()
        let marvelAPIURLBuilder = MarvelAPIURLBuilder(apiKeys: MarvelAPICredentials.defaultKeys)
        let remoteData = ComicsListRemoteData(marvelAPIURLBuilder: marvelAPIURLBuilder, httpDataLoader: httpDataLoader)
        let dataGateway = ComicsListDataGateway(remoteData: remoteData)
        
        // Presentation layer
        let router = ComicsListRouter()
        let presenter = ComicsListPresenter(router: router)
        
        // Business Logic
        let interactor = ComicsListInteractor(presenter: presenter, dataGateway: dataGateway)
        
        // Dependency Injection
        comicsListViewController.interactor = interactor
        presenter.view = comicsListViewController
    }
}
