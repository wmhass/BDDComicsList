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
        beforeSuite {
        }
        context("Given that a comic title was selected/Characters names view is presented") {
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
