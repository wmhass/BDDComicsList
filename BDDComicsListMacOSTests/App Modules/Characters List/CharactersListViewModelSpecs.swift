//
//  CharactersListViewModelSpecs.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-23.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import Quick
import Nimble

class CharactersListViewModelSpecs: QuickSpec {
    
    var viewModel: CharactersListViewModel!
    let characters = [
        ComicCharacter(id: 2, name: "Ant man"),
        ComicCharacter(id: 3, name: "Tigra"),
        ComicCharacter(id: 1, name: "3d man"),
        ComicCharacter(id: 4, name: "Hank Pym")
    ]
    
    override func spec() {
        beforeSuite {
            self.viewModel = CharactersListViewModel(comicCharacters: self.characters)
        }
        describe("CharactersListViewModel") {
            context("When asked for the number of comic characters") {
                it("Should return the correct number of characters") {
                    expect(self.viewModel.numberOfCharacters).to(equal(self.characters.count))
                }
            }
        }
    }
    
}
