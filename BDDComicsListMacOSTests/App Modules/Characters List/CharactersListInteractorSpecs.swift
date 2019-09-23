//
//  CharactersListInteractorSpecs.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-17.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import Quick
import Nimble

class CharactersListInteractorSpecs: QuickSpec {
    
    var dataGatewayMock: CharactersListDataGatewayMock!
    var presenterMock: CharactersListPresenterMock!
    var interactor: CharactersListInteractor!
    let comic: Comic = Comic(id: 123, title: "A comic")
    
    override func spec() {
        beforeSuite {
            let dataGatewayMock = CharactersListDataGatewayMock()
            let presenterMock = CharactersListPresenterMock()
            let interactor = CharactersListInteractor(comic: self.comic, dataGateway: dataGatewayMock)
            interactor.presentation = presenterMock
            
            self.dataGatewayMock = dataGatewayMock
            self.presenterMock = presenterMock
            self.interactor = interactor
        }
        describe("CharactersListInteractor") {

            context("When it tries to load characters") {
                beforeEach {
                    self.presenterMock._didAskToPresentFetchDataActivityIndicator = (false, nil)
                    self.dataGatewayMock._didAttemptToFetchComicCharacters = false
                    self.interactor.loadListOfCharacters()
                }
                it("Should ask the data gateway to fetch the comics list") {
                    expect(self.dataGatewayMock._didAttemptToFetchComicCharacters).to(beTrue())
                }
                it("Should present a UI activity indicator") {
                    expect(self.presenterMock._didAskToPresentFetchDataActivityIndicator.didAsk).to(beTrue())
                    expect(self.presenterMock._didAskToPresentFetchDataActivityIndicator.shouldPresent).to(beTrue())
                }
            }
            context("When it finished loading comics") {
                beforeEach {
                    self.dataGatewayMock._fetchComicCharactersResultMock = .noInternetConnection
                    self.presenterMock._didAskToPresentFetchDataActivityIndicator = (false, nil)
                    self.interactor.loadListOfCharacters()
                }
                it("Should hide the UI activity indicator") {
                    expect(self.presenterMock._didAskToPresentFetchDataActivityIndicator.didAsk).to(beTrue())
                    expect(self.presenterMock._didAskToPresentFetchDataActivityIndicator.shouldPresent).to(beFalse())
                }
            }
            
        }
        describe("Given that the interactor has one Comic to display the list of characters") {
            context("When I don't have internet connection") {
                beforeEach {
                    self.presenterMock._didAskToPresentNoInternetConnectionErrorMessage = false
                    self.dataGatewayMock._fetchComicCharactersResultMock = .noInternetConnection
                    self.interactor.loadListOfCharacters()
                }
                it("Then present a message informing that there is no internet connection") {
                    expect(self.presenterMock._didAskToPresentNoInternetConnectionErrorMessage).to(beTrue())
                }
            }
            
            
            context("When the characters response is invalid") {
                beforeEach {
                    self.presenterMock._didAskToPresentResponseIsInvalid = false
                    self.dataGatewayMock._fetchComicCharactersResultMock = .responseIsInvalid
                    self.interactor.loadListOfCharacters()
                }
                it("Should present a message informing that it can not present the list of characters") {
                    expect(self.presenterMock._didAskToPresentResponseIsInvalid).to(beTrue())
                }
            }
            context("When the characters response is valid") {
                let characters = [
                    ComicCharacter(id: 2, name: "Ant man"),
                    ComicCharacter(id: 3, name: "Tigra"),
                    ComicCharacter(id: 1, name: "3d man"),
                    ComicCharacter(id: 4, name: "Hank Pym")
                ]
                beforeEach {
                    self.presenterMock._didAskToPresentComicCharacters = (false, nil)
                    self.dataGatewayMock._fetchComicCharactersResultMock = .success(characters: characters)
                    self.interactor.loadListOfCharacters()
                }
                it("Then present a view with the list of characters names sorted asc") {
                    expect(self.presenterMock._didAskToPresentComicCharacters.didAsk).to(beTrue())
                    expect(self.presenterMock._didAskToPresentComicCharacters.characters?.count).to(equal(characters.count))
                    
                    let presentingCharacters = self.presenterMock._didAskToPresentComicCharacters.characters!
                    expect(presentingCharacters[0].name).to(equal("3d man"))
                    expect(presentingCharacters[1].name).to(equal("Ant man"))
                    expect(presentingCharacters[2].name).to(equal("Hank Pym"))
                    expect(presentingCharacters[3].name).to(equal("Tigra"))
                }
            }
        }
    }
}
