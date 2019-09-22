//
//  ComicsListPresenterSpecs.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import Quick
import Nimble

//func presentResponseIsInvalid()
//func presentNoInternetConnectionErrorMessage()
//func presentFetchDataActivityIndicator(_ shouldPresent: Bool)
//func presentComics(groupedComics: GroupedComics)
//func presentCharacters(ofComic comic: Comic)

class ComicsListPresenterSpecs: QuickSpec {
    
    var presenter: ComicsListPresenter!
    var viewMock: ComicsListViewMock!
    var routerMock: ComicsListRouterMock!
    var interactorMock: ComicsListInteractorMock!
    
    override func spec() {
        beforeSuite {
            let interactorMock = ComicsListInteractorMock()
            let routerMock = ComicsListRouterMock()
            let viewMock = ComicsListViewMock()
            let presenter = ComicsListPresenter(router: routerMock, interactor: interactorMock)
            presenter.view = viewMock

            self.routerMock = routerMock
            self.viewMock = viewMock
            self.presenter = presenter
        }
        describe("ComicsListPresentationLogic") {
            context("When it is asked to presentResponseIsInvalid") {
                beforeEach {
                    self.viewMock._didAskToDisplayErrorAlert = (nil, nil)
                    self.presenter.presentResponseIsInvalid()
                }
                it("Should ask view to display an alert informing that there was an error with the server response") {
                    expect(self.viewMock._didAskToDisplayErrorAlert.title).to(equal("Failed fetching comics"))
                    expect(self.viewMock._didAskToDisplayErrorAlert.message).to(equal("We failed fetching the comics because there was an error with the server response"))
                }
            }
            
            context("When it is asked to presentNoInternetConnectionErrorMessage") {
                beforeEach {
                    self.viewMock._didAskToDisplayErrorAlert = (nil, nil)
                    self.presenter.presentNoInternetConnectionErrorMessage()
                }
                it("Should ask view to display an alert informing that there is no internet connection") {
                    expect(self.viewMock._didAskToDisplayErrorAlert.title).to(equal("No internet connection"))
                    expect(self.viewMock._didAskToDisplayErrorAlert.message).to(equal("We failed fetching the comics because there are no internet connection"))
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
            
            context("When it is asked to presentCharacters") {
                let comic = Comic(id: 123, title: "Comic 1")
                beforeEach {
                    self.routerMock._didAskPushCharactersListView = (false, nil)
                    self.presenter.presentCharacters(ofComic: comic)
                }
                it("Should ask the router to present the characters list view") {
                    expect(self.routerMock._didAskPushCharactersListView.didAsk).to(beTrue())
                    expect(self.routerMock._didAskPushCharactersListView.comic).to(equal(comic))
                }
            }
            
            context("When it is asked to presentComics(groupedComics: GroupedComics)") {
                let comics = [
                    Comic(id: 123, title: "Comic 1"),
                    Comic(id: 234, title: "Comic 2"),
                    Comic(id: 345, title: "Comic 3")
                ]
                let groupedComics = GroupedSortedComics(comics: comics)
                beforeEach {
                    self.viewMock._didAskToDisplayViewModel = (false, nil)
                    self.presenter.presentComics(groupedComics: groupedComics)
                }
                it("Should ask the view to present a view model") {
                    expect(self.viewMock._didAskToDisplayViewModel.didAsk).to(beTrue())
                    expect(self.viewMock._didAskToDisplayViewModel.viewModel).toNot(beNil())
                }
            }
            
        }
    }
}
