//
//  CharactersListModuleDependencies.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-27.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class CharactersListModuleDependencies {
    
    func injectDependencies<T>(charactersListViewController: T,
                               dataGateway: CharactersListDataGatewayLogic,
                               comic: Comic) where T: UIViewController, T:CharactersListViewConnectable, T:CharactersListDisplayLogic {
        // Business Logic
        let interactor = CharactersListInteractor(comic: comic, dataGateway: dataGateway)
        
        // Presentation layer
        let presenter = CharactersListPresenter(interactor: interactor)
        
        // Dependency Injection
        charactersListViewController.eventHandler = presenter
        charactersListViewController.dataSource = presenter
        presenter.view = charactersListViewController
        interactor.presentation = presenter
        
    }
}
