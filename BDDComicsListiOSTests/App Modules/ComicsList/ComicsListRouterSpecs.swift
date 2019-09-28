//
//  ComicsListRouterSpecs.swift
//  BDDComicsListiOSTests
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import BDDComicsList

class ComicsListRouterSpecs: QuickSpec {
    
    var router: ComicsListRouter!

    override func spec() {
        beforeSuite {
        }
        describe("ComicsListRouter") {
            beforeEach {
            }
            context("When asked to push a characters list") {
                beforeEach {
                    
                }
                it("Should tell the viewcontroller to perform the characterlistsegue passing the correct setup closure") {
                    
                }
            }
            context("When connecting dependencies of the CharactersListViewController") {
                it("Should set am interactor to the viewcontroller") {
                    
                }
            }
        }
    }
    
}
