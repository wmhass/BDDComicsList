//
//  ComicsListInteractorMock.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class ComicsListInteractorMock {
    var _didAskToLoadListOfComics: Bool = false
}

extension ComicsListInteractorMock: ComicsListBusinessLogic {
    func loadListOfComics() {
        _didAskToLoadListOfComics = true
    }
    func comicSelected(comic: Comic) {
        
    }
}
