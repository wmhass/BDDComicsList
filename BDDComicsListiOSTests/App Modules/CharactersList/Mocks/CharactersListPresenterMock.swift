//
//  CharactersListPresenterMock.swift
//  BDDComicsListiOSTests
//
//  Created by William Hass on 2019-09-23.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
@testable import BDDComicsList

final class CharactersListPresenterMock {
    var _didNotifyViewIsReadyToDisplayContent: Bool = false
    let _characters: [ComicCharacter]
    
    init(characters: [ComicCharacter]) {
        self._characters = characters
    }
    
}

// MARK: - CharactersListViewEventHandler
extension CharactersListPresenterMock: CharactersListViewEventHandler {
    func viewIsReadyToDisplayContent() {
        _didNotifyViewIsReadyToDisplayContent = true
    }
}

// MARK: - CharactersListViewDataSource
extension CharactersListPresenterMock: CharactersListViewDataSource {
    var numberOfCharacters: Int {
        return _characters.count
    }
    func nameOfCharacter(atIndex index: Int) -> String? {
        guard _characters.indices.contains(index) else {
            return nil
        }
        return _characters[index].name
    }
}
