//
//  CharactersListViewDataSource.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

protocol CharactersListViewDataSource {
    var numberOfCharacters: Int { get }
    func nameOfCharacter(atIndex index: Int) -> String?
}
