//
//  ComicsListInteractorMock.swift
//  BDDComicsListiOSTests
//
//  Created by William Hass on 2019-09-21.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
@testable import BDDComicsList

class ComicsListInteractorMock {
    var _didAskToLoadListOfComics: Bool = false
}

extension ComicsListInteractorMock: ComicsListBusinessLogic {
    func comicSelected(comic: Comic) {
        
    }

    func loadListOfComics() {
        _didAskToLoadListOfComics = true
    }
}
