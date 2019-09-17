//
//  ComicsListSpecs.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-17.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import Quick
import Nimble

class ComicsListSpecs: QuickSpec {
    
    override func spec() {

        describe("Given that the app is fetching comics") {
            it("Should present a UI activity indicator") {
                
            }
        }
        
        describe("Given that the app finished fetching comics") {
            it("Should hide the UI activity indicator") {
                
            }
        }
        
        describe("Given that I don't have internet connection") {
            it("Should present a message informing that it can not present the list of comics") {
                
            }
        }
        
        describe("Given that I have internet connection") {
            context("When the server response is invalid") {
                it("Present an error message informing that the content couldn't be read") {
                    
                }
            }
            context("When the server response is valid") {
                it("Should present a list of Marvel Comics titles grouped by the first letter of the comic's title") {
                    
                }
            }
        }
        
        describe("Given that the list of comics is presented") {
            context("When I tap on a comic title") {
                it("Should present the lst of characters of that comic") {
                    
                }
            }
        }
    }
}
