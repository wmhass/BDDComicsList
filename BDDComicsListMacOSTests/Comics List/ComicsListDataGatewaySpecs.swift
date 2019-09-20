//
//  ComicsListDataGatewaySpecs.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-20.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import Quick
import Nimble

class ComicsListDataGatewaySpecs: QuickSpec {
    
    var dataGateway: ComicsListDataGateway!
    
    override func spec() {
        beforeSuite {
            self.dataGateway = ComicsListDataGateway()
        }
        
        describe("Given that I don't have internet connection") {
            beforeEach {
                
            }
            context("When trying to fetch comics") {
                beforeEach {
                    
                }
                it("Should call the completion block passing noInternetConnection result") {
                    
                }
            }
        }
        
        describe("Given that I have internet connection") {
            beforeEach {
                
            }
            context("When trying to fetch comics") {
                beforeEach {
                    
                }
                context("When the response could be parsed") {
                    beforeEach {
                        
                    }
                    it("Should call the completion block passing the comics") {
                        
                    }
                }
                context("When the response couldn't be parsed") {
                    beforeEach {
                        
                    }
                    it("Should call the completion block passing response invalid result") {
                        
                    }
                }
            }
        }
        
        describe("ComicsListDataGateway") {
            context("When asked to fetch comics") {
                it("") {
                    
                    waitUntil(timeout: 2) { done in
                        self.dataGateway.fetchComics { response in
                            done()
                        }
                    }
                    
                }
            }
        }
    }
    
}
