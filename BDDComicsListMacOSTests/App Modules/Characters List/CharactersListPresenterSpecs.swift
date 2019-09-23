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
    let characters = [
        ComicCharacter(id: 2, name: "Ant man"),
        ComicCharacter(id: 3, name: "Tigra"),
        ComicCharacter(id: 1, name: "3d man"),
        ComicCharacter(id: 4, name: "Hank Pym")
    ]

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
                beforeEach {
                    self.presenter.presentComicCharacters(characters: self.characters)
                }
                it("Should return the correct number of characters") {
                    expect(self.presenter.numberOfCharacters).to(equal(self.characters.count))
                }
                it("Should return the correct title for each character") {
                    expect(self.presenter.nameOfCharacter(atIndex: 0)).to(equal(self.characters[0].name))
                    expect(self.presenter.nameOfCharacter(atIndex: 1)).to(equal(self.characters[1].name))
                    expect(self.presenter.nameOfCharacter(atIndex: 2)).to(equal(self.characters[2].name))
                    expect(self.presenter.nameOfCharacter(atIndex: 3)).to(equal(self.characters[3].name))
                }
                it("Should return nil title for an out of bounds index") {
                    expect(self.presenter.nameOfCharacter(atIndex: -1)).to(beNil())
                    expect(self.presenter.nameOfCharacter(atIndex: 4)).to(beNil())
                }
            }
        }
        
        describe("CharactersListViewEventHandler") {
            context("When view is ready to display content") {
                beforeEach {
                    self.interactorMock._didCallLoadListOfCharacters = false
                    self.presenter.viewIsReadyToDisplayContent()
                }
                it("Should ask interactor to load the list of comic characters") {
                    expect(self.interactorMock._didCallLoadListOfCharacters).to(beTrue())
                }
            }
        }
        
        describe("CharactersListPresentationLogic") {
            context("When it is asked to presentResponseIsInvalid") {
                beforeEach {
                    self.viewMock._didAskToDisplayErrorAlert = (nil, nil)
                    self.presenter.presentResponseIsInvalid()
                }
                it("Should ask view to display an alert informing that there was an error with the server response") {
                    expect(self.viewMock._didAskToDisplayErrorAlert.title).to(equal(AppErrorMessages.FailedFetchingComicCharacters.title.rawValue))
                    expect(self.viewMock._didAskToDisplayErrorAlert.message).to(equal(AppErrorMessages.FailedFetchingComicCharacters.message.rawValue))
                }
            }
            
            context("When it is asked to presentNoInternetConnectionErrorMessage") {
                beforeEach {
                    self.viewMock._didAskToDisplayErrorAlert = (nil, nil)
                    self.presenter.presentNoInternetConnectionErrorMessage()
                }
                it("Should ask view to display an alert informing that there is no internet connection") {
                    expect(self.viewMock._didAskToDisplayErrorAlert.title).to(equal(AppErrorMessages.NoInternetConnectionErrorMessage.title.rawValue))
                    expect(self.viewMock._didAskToDisplayErrorAlert.message).to(equal(AppErrorMessages.NoInternetConnectionErrorMessage.message.rawValue))
                }
            }
            
            context("When it is asked to presentFetchDataActivityIndicator with true value") {
                beforeEach {
                    self.viewMock._didAskToDisplayActivityView = (false, nil)
                    self.presenter.presentFetchDataActivityIndicator(true)
                }
                it("Should ask view to display a UI activity indicator") {
                    expect(self.viewMock._didAskToDisplayActivityView.didAsk).to(beTrue())
                    expect(self.viewMock._didAskToDisplayActivityView.shouldDisplay).to(beTrue())
                }
            }
            
            context("When it is asked to presentFetchDataActivityIndicator with false value") {
                beforeEach {
                    self.viewMock._didAskToDisplayActivityView = (false, nil)
                    self.presenter.presentFetchDataActivityIndicator(false)
                }
                it("Should ask view to hide a UI activity indicator") {
                    expect(self.viewMock._didAskToDisplayActivityView.didAsk).to(beTrue())
                    expect(self.viewMock._didAskToDisplayActivityView.shouldDisplay).to(beFalse())
                }
            }
            
            context("When it is asked to presentComicCharacters(characters: [ComicCharacter])") {
                beforeEach {
                    self.viewMock._didAskToReloadListOfCharacters = false
                    self.presenter.presentComicCharacters(characters: self.characters)
                }
                it("Should ask the view to reload the table data") {
                    expect(self.viewMock._didAskToReloadListOfCharacters).to(beTrue())
                }
            }
            
        }
    }
    
}
