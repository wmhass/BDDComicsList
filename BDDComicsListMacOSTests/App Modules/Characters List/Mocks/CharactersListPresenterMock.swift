
//
//  CharactersListPresenterMock.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class CharactersListPresenterMock {
    var _didAskToPresentResponseIsInvalid: Bool = false
    var _didAskToPresentNoInternetConnectionErrorMessage: Bool = false
    var _didAskToPresentFetchDataActivityIndicator: (didAsk: Bool, shouldPresent: Bool?) = (false, nil)
    var _didAskToPresentComicCharacters: (didAsk: Bool, characters: [ComicCharacter]?) = (false, nil)
    var _didAskToPresentViewTitle: (didAsk: Bool, viewTitle: String?) = (false, nil)
}

extension CharactersListPresenterMock: CharactersListPresentationLogic {
    func presentNoInternetConnectionErrorMessage() {
        _didAskToPresentNoInternetConnectionErrorMessage = true
    }
    func presentFetchDataActivityIndicator(_ shouldPresent: Bool) {
        _didAskToPresentFetchDataActivityIndicator = (true, shouldPresent)
    }
    func presentResponseIsInvalid() {
        _didAskToPresentResponseIsInvalid = true
    }
    func presentComicCharacters(characters: [ComicCharacter]) {
        _didAskToPresentComicCharacters = (true, characters)
    }
    func presentViewTitle(_ viewTitle: String) {
        _didAskToPresentViewTitle = (true, viewTitle)
    }
}
