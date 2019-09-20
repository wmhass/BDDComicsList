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
}

extension ComicsListPresenter: ComicsListPresentationLogic {
    func presentComics(groupedComics: GroupedComics) {

    }
    
    func presentFetchDataActivityIndicator(_ shouldPresent: Bool) {

    }
    
    func presentNoInternetConnectionErrorMessage() {
        
    }
    
    func presentResponseIsInvalid() {
        self.view?.displayErrorAlert(title: "No internet connection", message: "We failed fetching the comics because there are no internet connection")
    }
    func presentCharacters(ofComic comic: Comic) {
        
    }
}
