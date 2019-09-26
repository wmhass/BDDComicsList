//
//  CharactersListViewModel.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

struct CharactersListViewModel {
    var viewTitle: String?
    fileprivate let comicCharacters: [ComicCharacter]
    init(comicCharacters: [ComicCharacter]) {
        self.comicCharacters = comicCharacters
    }
}

extension CharactersListViewModel {
    var numberOfCharacters: Int {
        return self.comicCharacters.count
    }
    
    func nameOfCharacter(atIndex characterIndex: Int) -> String? {
        guard self.comicCharacters.indices.contains(characterIndex) else {
            return nil
        }
        return self.comicCharacters[characterIndex].name
    }
}
