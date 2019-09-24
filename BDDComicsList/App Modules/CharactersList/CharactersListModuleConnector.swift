//
//  CharactersListModuleConnector.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class CharactersListModuleConnector {
    
    var preConnection: (ComicsListViewController?,CharactersListViewController?)->Void = { _,_ in }
    
    let comic: Comic
    init(comic: Comic) {
        self.comic = comic
    }

    func connectDependencies(comicsListViewController: ComicsListViewController?, charactersListViewController: CharactersListViewController?) {
        self.preConnection(comicsListViewController, charactersListViewController)

        // Data Layer
        let httpDataLoader = HTTPDataLoader()
        let marvelAPIURLBuilder = MarvelAPIURLBuilder(apiKeys: MarvelAPICredentials.defaultKeys)
        let remoteData = CharactersListRemoteData(marvelAPIURLBuilder: marvelAPIURLBuilder, httpDataLoader: httpDataLoader)
        let dataGateway = CharactersListDataGateway(remoteData: remoteData)
        
        // Business Logic
        let interactor = CharactersListInteractor(comic: self.comic, dataGateway: dataGateway)
        
        // Presentation layer
        let presenter = CharactersListPresenter(interactor: interactor)
        
        // Dependency Injection
        charactersListViewController?.eventHandler = presenter
        charactersListViewController?.dataSource = presenter
        presenter.view = charactersListViewController
        interactor.presentation = presenter
    }
}
