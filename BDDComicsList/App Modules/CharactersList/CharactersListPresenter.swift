//
//  CharactersListPresenter.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class CharactersListPresenter {

    weak var view: CharactersListDisplayLogic?
    let interactor: CharactersListBusinessLogic
    fileprivate var viewModel: CharactersListViewModel?
    
    init(interactor: CharactersListBusinessLogic) {
        self.interactor = interactor
    }

}

extension CharactersListPresenter: CharactersListPresentationLogic {
    func presentResponseIsInvalid() {
        
    }
    func presentFetchDataActivityIndicator(_ shouldPresent: Bool) {
        
    }
    func presentNoInternetConnectionErrorMessage() {
        
    }
    func presentComicCharacters(characters: [ComicCharacter]) {
        
    }
}

extension CharactersListPresenter: CharactersListViewDataSource {
    var numberOfCharacters: Int {
        return 0
    }
    
    func nameOfCharacter(atIndex index: Int) -> String? {
        return nil
    }
}

extension CharactersListPresenter: CharactersListViewEventHandler {
    func viewIsReadyToDisplayContent() {

    }
}
