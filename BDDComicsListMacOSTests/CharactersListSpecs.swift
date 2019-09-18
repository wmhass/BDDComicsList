//
//  CharactersListSpecs.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-17.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import Quick
import Nimble

class CharactersListSpecs: QuickSpec {
    override func spec() {

        describe("Given that a list of comics characters was successfully loaded") {
            context("When the view with the list of comic characters is presented") {
                it("Should show the name of the comic as the view's title") {
                    // TODO: Assert
                }
            }
        }
        
//        This scenario is not specified in the User Stories scenarios because this is an implementation behaviour
        describe("Given that a comic title was tapped") {
            context("And the characters list view is presentet") {
                it("Should present a list with the name of the characters") {
                    // TODO: Assert
                }
            }
        }
    }
}
