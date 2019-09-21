//
//  ComicsListPresenter.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-18.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class ComicsListPresenter {
    weak var view: ComicsListDisplayLogic?
    let router: ComicsListRoutingLogic
    
    init(router: ComicsListRoutingLogic) {
        self.router = router
    }
}

extension ComicsListPresenter: ComicsListPresentationLogic {
    func presentComics(groupedComics: GroupedSortedComics) {
        self.view?.displayComics(viewModel: ComicsListViewModel(groupedComics: groupedComics))
    }
    
    func presentFetchDataActivityIndicator(_ shouldPresent: Bool) {
        self.view?.displayUIActivityView(shouldPresent)
    }
    
    func presentNoInternetConnectionErrorMessage() {
        self.view?.displayErrorAlert(title: "No internet connection", message: "We failed fetching the comics because there are no internet connection")
    }
    
    func presentResponseIsInvalid() {
        self.view?.displayErrorAlert(title: "Failed fetching comics", message: "We failed fetching the comics because there was an error with the server response")
    }
    func presentCharacters(ofComic comic: Comic) {
        self.router.pushCharactersListView(ofComic: comic)
    }
}
