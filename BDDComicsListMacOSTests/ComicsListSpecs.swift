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

//*ViewController -> Conforma "DisplayLogic", e tem uma propriedade `interactor: BusinessLogic`
//
//*Interactor -> Conforma "BusinessLogic", e tem uma propriedade `presenter: PresentationLogic`
//
//*Presenter -> Conforma "PresentationLogic" e tem uma propriedade `view: DisplayLogic`

protocol ComicsListBusinessLogic {
}

class ComicsListInteractor {
}

extension ComicsListInteractor: ComicsListBusinessLogic {
}

class ComicsListSpecs: QuickSpec {
    
    override func spec() {
        describe("Given that I don't have internet connection") {
            context("When I open the app") {
                it("Then present a message informing that there is no internet connection") {
                    // TODO: Assert
                }
            }
            context("When it tries to load the comics") {
                it("Should not present a UI activity inticator") {
                    // TODO: Assert
                }
            }
            context("And the list of comics has one or more items") {
                context("When I tap on a comic title") {
                    it("Then present a message informing that there is no internet connection") {
                        // TODO: Assert
                    }
                }
            }
        }
        
        describe("Given that I have internet connection") {
            context("When the comics list response is invalid") {
                it("Should present an error message informing that the content couldn't be read") {
                    // TODO: Assert
                }
            }
            context("When the comics list response is valid") {
                it("Should present a list of Marvel Comics titles grouped by the first letter of the comic's title") {
                    // TODO: Assert
                }
            }
            context("When it tries to load the comics") {
                it("Should present a UI activity inticator") {
                    // TODO: Assert
                }
            }
            context("When it finished loading the comics") {
                it("Should hide the UI activity inticator") {
                    // TODO: Assert
                }
            }
            context("And the list of comics has one or more items") {
                context("When I tap on a comic title") {
                    context("And the response is invalid") {
                        it("Should present a message informing that it can not present the list of characters") {
                            // TODO: Assert
                        }
                    }
                    context("And the response is valid") {
                        it("Then present a list with the name of the characters of that comic") {
                            // TODO: Assert
                        }
                    }
                }
            }
        }
    }
}
