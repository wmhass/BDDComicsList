//
//  ComicsListPresenterMock.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class ComicsListPresentationMock {
    var _didAskToPresentResponseIsInvalid: Bool = false
    var _didAskToPresentNoInternetConnectionErrorMessage: Bool = false
    var _didAskToPresentFetchDataActivityIndicator: (didAsk: Bool, shouldPresent: Bool?) = (false, nil)
    var _didAskToPresentComics: (didAsk: Bool, groupedComics: GroupedSortedComics?) = (false, nil)
    var _didAskToPresentCharactersOfComic: Comic?
}

extension ComicsListPresentationMock: ComicsListPresentationLogic {
    func presentNoInternetConnectionErrorMessage() {
        _didAskToPresentNoInternetConnectionErrorMessage = true
    }
    func presentFetchDataActivityIndicator(_ shouldPresent: Bool) {
        _didAskToPresentFetchDataActivityIndicator = (true, shouldPresent)
    }
    func presentResponseIsInvalid() {
        _didAskToPresentResponseIsInvalid = true
    }
    func presentComics(groupedComics: GroupedSortedComics) {
        self._didAskToPresentComics = (true, groupedComics)
    }
    func presentCharacters(ofComic comic: Comic) {
        _didAskToPresentCharactersOfComic = comic
    }
}
