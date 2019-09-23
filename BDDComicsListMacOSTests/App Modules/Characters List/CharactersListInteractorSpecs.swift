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
        describe("Given that the interactor has one Comic to display the list of characters") {

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
            
            context("When I don't have internet connection") {
                beforeEach {
                }
                it("Then present a message informing that there is no internet connection") {
                    // TODO: Assert
                }
            }
            context("When the characters response is invalid") {
                beforeEach {
                }
                it("Should present a message informing that it can not present the list of characters") {
                    // TODO: Assert
                }
            }
            context("When the characters response is valid") {
                beforeEach {
                }
                it("Then present a view with the list of characters names") {
                    // TODO: Assert
                }
            }
        }
    }
}
