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
            context("When asked the name of a character at a valid given index") {
                it("Should return the correct name") {
                    expect(self.viewModel.nameOfCharacter(atIndex: 0)).to(equal(self.characters[0].name))
                    expect(self.viewModel.nameOfCharacter(atIndex: 1)).to(equal(self.characters[1].name))
                    expect(self.viewModel.nameOfCharacter(atIndex: 2)).to(equal(self.characters[2].name))
                    expect(self.viewModel.nameOfCharacter(atIndex: 3)).to(equal(self.characters[3].name))
                }
            }
            context("When asked the name of a character at an out of bounds index") {
                it("Should return nil") {
                    expect(self.viewModel.nameOfCharacter(atIndex: 4)).to(beNil())
                }
            }
        }
    }
    
}
