//
//  CharactersListRemoteDataSpecs.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-23.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import Quick
import Nimble

final class CharactersListRemoteDataSpecs: QuickSpec {
    
    var remoteData: CharactersListRemoteData!

    override func spec() {
        beforeSuite {
            let httpDataLoader = HTTPDataLoader()
            let urlBuilder = MarvelAPIURLBuilder(apiKeys: MarvelAPICredentials.defaultKeys)
            let remoteData = CharactersListRemoteData(marvelAPIURLBuilder: urlBuilder, httpDataLoader: httpDataLoader)
            
            self.remoteData = remoteData
        }
        describe("CharactersListRemoteData") {
            context("When asking to fetch all characters from a comic") {
                let comic = Comic(id: 183, title: "Startling Stories: The Incorrigible Hulk (2004) #1")
                it("Should load list of comics") {
                    waitUntil(timeout: 10) { done in
                        self.remoteData.fetchAllCharacters(comic: comic) { fetchResponse in
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
