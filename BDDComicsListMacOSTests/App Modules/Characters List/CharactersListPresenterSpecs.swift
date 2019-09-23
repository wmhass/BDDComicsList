//
//  CharactersListPresenterSpecs.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import Quick
import Nimble

class CharactersListPresenterSpecs: QuickSpec {
    
    var presenter: CharactersListPresenter!
    var viewMock: CharactersListViewMock!
    var interactorMock: CharactersListInteractorMock!
    
    override func spec() {
        beforeSuite {
            let interactorMock = CharactersListInteractorMock()
            let viewMock = CharactersListViewMock()
            let presenter = CharactersListPresenter(interactor: interactorMock)
            presenter.view = viewMock
            
            self.interactorMock = interactorMock
            self.viewMock = viewMock
            self.presenter = presenter
        }
        describe("CharactersListViewDataSource") {
            context("When there are comic characters to present") {
                let characters = [
                    ComicCharacter(id: 1, name: "Ant-Man"),
                ]
                beforeEach {
                    
                }
                it("Should return the correct number of characters") {
                }
                it("Should return the correct title for each character") {
                }
            }
        }
        
        describe("CharactersListViewEventHandler") {
            context("When view is ready to display content") {
                beforeEach {
                }
                it("Should ask interactor to load the list of comic characters") {
                }
            }
        }
        
        describe("CharactersListPresentationLogic") {
            context("When it is asked to presentResponseIsInvalid") {
                beforeEach {
                }
                it("Should ask view to display an alert informing that there was an error with the server response") {
                }
            }
            
            context("When it is asked to presentNoInternetConnectionErrorMessage") {
                beforeEach {
                }
                it("Should ask view to display an alert informing that there is no internet connection") {
                }
            }
            
            context("When it is asked to presentFetchDataActivityIndicator with true value") {
                beforeEach {
                }
                it("Should ask view to display a UI activity indicator") {
                }
            }
            
            context("When it is asked to presentFetchDataActivityIndicator with false value") {
                beforeEach {
                }
                it("Should ask view to hide a UI activity indicator") {
                }
            }
            
            context("When it is asked to presentComicCharacters(characters: [ComicCharacter])") {
                beforeEach {
                }
                it("Should ask the view to reload the table data") {
                }
            }
            
        }
    }
    
}
