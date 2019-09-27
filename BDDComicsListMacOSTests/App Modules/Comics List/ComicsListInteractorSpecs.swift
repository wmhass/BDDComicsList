//
//  ComicsListInteractorSpecs.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-17.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import Quick
import Nimble

//*ViewController -> Conforma "DisplayLogic", e tem uma propriedade `interactor: BusinessLogic`
//
//*Interactor -> Conforma "BusinessLogic", e tem uma propriedade `presenter: PresentationLogic`
//
//*Presenter -> Conforma "PresentationLogic" e tem uma propriedade `view: DisplayLogic`s

class ComicsListInteractorSpecs: QuickSpec {
    
    var dataGatewayMock: ComicsListDataGatewayMock!
    var presenterMock: ComicsListPresentationMock!
    var interactor: ComicsListInteractor!
    
    override func spec() {
        beforeSuite {
            let dataGatewayMock = ComicsListDataGatewayMock()
            let presenterMock = ComicsListPresentationMock()
            let interactor = ComicsListInteractor(dataGateway: dataGatewayMock)
            interactor.presentation = presenterMock

            self.dataGatewayMock = dataGatewayMock
            self.presenterMock = presenterMock
            self.interactor = interactor
        }

        // This test case is not in the user stories list because it is a unit test
        describe("ComicsListInteractor") {
            context("When it tries to load comics") {
                beforeEach {
                    self.dataGatewayMock._didAttemptToFetchComics = false
                    self.presenterMock._didAskToPresentFetchDataActivityIndicator = (false, nil)
                    self.interactor.loadListOfComics()
                }
                it("Should ask the data gateway to fetch the comics list") {
                    expect(self.dataGatewayMock._didAttemptToFetchComics).to(beTrue())
                }
                it("Should present a UI activity indicator") {
                    expect(self.presenterMock._didAskToPresentFetchDataActivityIndicator.didAsk).to(beTrue())
                    expect(self.presenterMock._didAskToPresentFetchDataActivityIndicator.shouldPresent).to(beTrue())
                }
            }
            context("When it finished loading comics") {
                beforeEach {
                    self.dataGatewayMock._fetchComicsResponseMock = .noInternetConnection
                    self.presenterMock._didAskToPresentFetchDataActivityIndicator = (false, nil)
                    self.interactor.loadListOfComics()
                }
                it("Should hide the UI activity indicator") {
                    expect(self.presenterMock._didAskToPresentFetchDataActivityIndicator.didAsk).to(beTrue())
                    expect(self.presenterMock._didAskToPresentFetchDataActivityIndicator.shouldPresent).to(beFalse())
                }
            }
        }

        describe("Given that I don't have internet connection") {
            beforeEach {
                self.dataGatewayMock._fetchComicsResponseMock = .noInternetConnection
            }
            context("When it tries to load the comics") {
                beforeEach {
                    self.presenterMock._didAskToPresentNoInternetConnectionErrorMessage = false
                    self.interactor.loadListOfComics()
                }
                it("Then present a message informing that there is no internet connection") {
                    expect(self.presenterMock._didAskToPresentNoInternetConnectionErrorMessage).to(beTrue())
                }
            }
        }
        
        describe("Given that I have internet connection") {
            context("When the comics list response is invalid") {
                beforeEach {
                    self.dataGatewayMock._fetchComicsResponseMock = .responseIsInvalid
                    self.presenterMock._didAskToPresentResponseIsInvalid = false
                    self.interactor.loadListOfComics()
                }
                it("Should present an error message informing that the content couldn't be read") {
                    expect(self.presenterMock._didAskToPresentResponseIsInvalid).to(beTrue())
                }
            }
            context("When the comics list response is valid") {
                let comics = [Comic(id: 1, title: "Comic 1"), Comic(id: 2, title: "Comic 2")]
                let groupedComics = GroupedSortedComics(comics: comics)
                beforeEach {
                    self.dataGatewayMock._fetchComicsResponseMock = .success(comics: comics)
                    self.presenterMock._didAskToPresentComics = (false, nil)
                    self.interactor.loadListOfComics()
                }
                it("Should present comics list") {
                    expect(self.presenterMock._didAskToPresentComics.didAsk).to(beTrue())
                    expect(self.presenterMock._didAskToPresentComics.groupedComics).to(equal(groupedComics))
                }
            }
        }
        
        context("Given that there are one or more comics in the list") {
            let comic = Comic(id: 1, title: "Comic 1")
            context("When I select a comic title") {
                beforeEach {
                    self.presenterMock._didAskToPresentCharactersOfComic = nil
                    self.interactor.comicSelected(comic: comic)
                }
                it("Should present the list of characters view passing the selected comic") {
                    expect(self.presenterMock._didAskToPresentCharactersOfComic).to(equal(comic))
                }
            }
        }

    }
}
