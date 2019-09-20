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
    
    override func setUp() {
        beforeSuite {
            
        }
        
        describe("ComicsListPresenter") {
            
            context("When it is asked to presentResponseIsInvalid") {
                it("Should ask view to display a message saying...") {
                    
                }
            }
            
            context("When it is asked to presentNoInternetConnectionErrorMessage") {
                it("Should ask view to display a message saying...") {
                    
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
