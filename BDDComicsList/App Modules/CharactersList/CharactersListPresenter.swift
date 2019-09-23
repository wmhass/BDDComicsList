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
    fileprivate var viewModel: CharactersListViewModel
    
    init(interactor: CharactersListBusinessLogic) {
        self.interactor = interactor
        self.viewModel = CharactersListViewModel()
    }

}

extension CharactersListPresenter: CharactersListPresentationLogic {
    func presentViewTitle(_ viewTitle: String) {
        self.view?.displayViewTitle(viewTitle)
    }
    func presentResponseIsInvalid() {
        self.view?.displayErrorAlert(title: AppErrorMessages.FailedFetchingComicCharacters.title.rawValue,
                                     message: AppErrorMessages.FailedFetchingComicCharacters.message.rawValue)
    }
    func presentFetchDataActivityIndicator(_ shouldPresent: Bool) {
        self.view?.displayUIActivityView(shouldPresent)
    }
    func presentNoInternetConnectionErrorMessage() {
        self.view?.displayErrorAlert(title: AppErrorMessages.NoInternetConnectionErrorMessage.title.rawValue,
                                     message: AppErrorMessages.NoInternetConnectionErrorMessage.message.rawValue)
    }
    func presentComicCharacters(characters: [ComicCharacter]) {
        self.viewModel.set(comicCharacters: characters)
        self.view?.reloadListOfCharacters()
    }
}

extension CharactersListPresenter: CharactersListViewDataSource {
    var numberOfCharacters: Int {
        return self.viewModel.numberOfCharacters
    }
    
    func nameOfCharacter(atIndex index: Int) -> String? {
        return self.viewModel.nameOfCharacter(atIndex: index)
    }
}

extension CharactersListPresenter: CharactersListViewEventHandler {
    func viewIsReadyToDisplayContent() {
        self.interactor.loadViewTitle()
        self.interactor.loadListOfCharacters()
    }
}
