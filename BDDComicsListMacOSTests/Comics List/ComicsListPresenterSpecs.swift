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

    override func spec() {
        beforeSuite {
            let viewMock = ComicsListViewMock()
            let presenter = ComicsListPresenter()
            presenter.view = viewMock
            
            self.viewMock = viewMock
            self.presenter = presenter
        }
        describe("ComicsListPresenter") {
            context("When it is asked to presentResponseIsInvalid") {
                beforeEach {
                    self.viewMock._didAskTodisplayErrorAlert = (nil, nil)
                    self.presenter.presentResponseIsInvalid()
                }
                it("Should ask view to display an alert informing that there was an error with the server response") {
                    expect(self.viewMock._didAskTodisplayErrorAlert.title).to(equal("Failed fetching comics"))
                    expect(self.viewMock._didAskTodisplayErrorAlert.message).to(equal("We failed fetching the comics because there was an error with the server response"))
                }
            }
            
            context("When it is asked to presentNoInternetConnectionErrorMessage") {
                beforeEach {
                    self.viewMock._didAskTodisplayErrorAlert = (nil, nil)
                    self.presenter.presentNoInternetConnectionErrorMessage()
                }
                it("Should ask view to display an alert informing that there is no internet connection") {
                    expect(self.viewMock._didAskTodisplayErrorAlert.title).to(equal("No internet connection"))
                    expect(self.viewMock._didAskTodisplayErrorAlert.message).to(equal("We failed fetching the comics because there are no internet connection"))
                }
            }
            
            context("When it is asked to presentFetchDataActivityIndicator with true value") {
                it("Should ask view to display a UI activity indicator") {
                    
                }
            }
            
            context("When it is asked to presentFetchDataActivityIndicator with false value") {
                it("Should ask view to hide a UI activity indicator") {
                    
                }
            }
            
            context("When it is asked to presentCharacters") {
                it("Should ask the router to present the characters list view") {
                    
                }
            }
            
            context("When it is asked to presentComics(groupedComics: GroupedComics)") {
                it("Should ask the view to present a view model with the grouped comics") {
                    
                }
            }
            
        }
    }
}
