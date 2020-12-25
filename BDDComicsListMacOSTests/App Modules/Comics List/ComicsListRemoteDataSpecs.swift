//
//  ComicsListRemoteDataSpecs.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-21.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import Quick
import Nimble


final class ComicsListRemoteDataSpecs: QuickSpec {
    
    var remoteData: ComicsListRemoteData!
    
    override func spec() {
        beforeSuite {
            let httpDataLoader = HTTPDataLoader()
            let urlBuilder = MarvelAPIURLBuilder(apiKeys: MarvelAPICredentials.defaultKeys)
            let remoteData = ComicsListRemoteData(marvelAPIURLBuilder: urlBuilder, httpDataLoader: httpDataLoader)
            
            self.remoteData = remoteData
        }
        describe("ComicsListRemoteData") {
            context("When asking to fetchAllComics") {
                it("Should load comics correctly") {
                    waitUntil(timeout: 10) { done in
                        self.remoteData.fetchAllComics { fetchResponse in
                            switch fetchResponse {
                            case .success(let response):
                                expect(response.code).to(equal(200))
                            default:
                                fail("Response wasn't loaded")
                            }
                            done()
                        }
                    }
                }
            }
        }
    }
    
}
