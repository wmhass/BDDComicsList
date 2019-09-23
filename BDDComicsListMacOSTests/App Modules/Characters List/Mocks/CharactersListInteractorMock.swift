//
//  CharactersListInteractorMock.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-23.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class CharactersListInteractorMock {
    var _didCallLoadListOfCharacters: Bool = false
    var _didCallLoadViewTitle: Bool = false
}

extension CharactersListInteractorMock: CharactersListBusinessLogic {
    func loadListOfCharacters() {
        _didCallLoadListOfCharacters = true
    }
    func loadViewTitle() {
        _didCallLoadViewTitle = true
    }
}
