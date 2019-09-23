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
    
    override func spec() {
        beforeSuite {
            //self.presenter = CharactersListPresenter()
        }
        describe("ComicsListViewDataSource") {
            context("When there are comics to present") {
                it("Should return the correct number of comics in each section") {
                }
                it("Should return the correct title for each comic") {
                }
            }
        }
        
        describe("ComicsListViewEventHandler") {
            context("When view is ready to display content") {
                beforeEach {
                }
                it("Should ask interactor to load the list of comics") {
                }
            }
        }
        
        describe("ComicsListPresentationLogic") {
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
            
            
            context("When it is asked to presentComics(groupedComics: GroupedComics)") {
                beforeEach {
                }
                it("Should ask the view to reload the table data") {
                }
            }
            
        }
    }
    
}
