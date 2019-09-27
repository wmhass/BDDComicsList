//
//  CharactersListDataGatewaySpecs.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-23.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import Quick
import Nimble

class CharactersListDataGatewaySpecs: QuickSpec {

    let remoteDataMock = CharactersListRemoteDataMock()
    var dataGateway: CharactersListDataGateway!
    let comic = Comic(id: 183, title: "Startling Stories: The Incorrigible Hulk (2004) #1")
    let characters = [
        ComicCharacter(id: 2, name: "Ant man"),
        ComicCharacter(id: 3, name: "Tigra"),
        ComicCharacter(id: 1, name: "3d man"),
        ComicCharacter(id: 4, name: "Hank Pym")
    ]

    override func spec() {
        beforeSuite {
            self.dataGateway = CharactersListDataGateway(remoteData: self.remoteDataMock)
        }
        
        describe("Given that I don't have internet connection") {
            beforeEach {
                self.dataGateway.hasInternetConnection = false
            }
            context("When trying to fetch comics") {
                it("Should call the completion block passing noInternetConnection result") {
                    waitUntil(timeout: 1) { done in
                        self.dataGateway.fetchComicCharacters(comic: self.comic) { charactersResponse in
                            let isNoInternetConnection: Bool = {
                                switch charactersResponse {
                                case .failure(let error):
                                    switch error {
                                    case .noInternetConnection:
                                        return true
                                    default:
                                        return false
                                    }
                                default:
                                    return false
                                }
                            }()
                            expect(isNoInternetConnection).to(beTrue())
                            done()
                        }
                    }
                }
            }
        }
        
        describe("Given that I have internet connection") {
            beforeEach {
                self.dataGateway.hasInternetConnection = true
            }
            context("When asked to fetch comics") {
                beforeEach {
                    self.remoteDataMock._didAskFetchAllCharacters = (false, nil)
                    self.dataGateway.fetchComicCharacters(comic: self.comic) { _ in }
                }
                it("Should ask the remote data for the comics") {
                    expect(self.remoteDataMock._didAskFetchAllCharacters.didAsk).to(beTrue())
                    expect(self.remoteDataMock._didAskFetchAllCharacters.comic).to(equal(self.comic))
                }
            }
            context("When the fetch comics response could not be parsed") {
                beforeEach {
                    self.remoteDataMock._fakeResponse = .failure(.failedParsingData)
                }
                it("Should call the completion block passing responseIsInvalid") {
                    waitUntil(timeout: 1) { done in
                        self.dataGateway.fetchComicCharacters(comic: self.comic) { charactersResponse in
                            let isResponseInvalid: Bool = {
                                switch charactersResponse {
                                case .failure(let error):
                                    switch error {
                                    case .responseIsInvalid:
                                        return true
                                    default:
                                        return false
                                    }
                                default:
                                    return false
                                }
                            }()
                            expect(isResponseInvalid).to(beTrue())
                            done()
                        }
                    }
                }
            }
            
            context("When the fetch comics response could be parsed and succeeded") {
                beforeEach {
                    let charactersResponseData = MarvelComicCharactersResponseData(results: self.characters)
                    self.remoteDataMock._fakeResponse = .success(MarvelComicCharactersResponse(code: 200, status: "", data: charactersResponseData))
                }
                it("Should call the completion block passing the comics") {
                    waitUntil(timeout: 1) { done in
                        self.dataGateway.fetchComicCharacters(comic: self.comic) { charactersResponse in
                            let isResponseValid: Bool = {
                                switch charactersResponse {
                                case .success(_):
                                    return true
                                default:
                                    return false
                                }
                            }()
                            expect(isResponseValid).to(beTrue())
                            done()
                        }
                    }
                }
            }
            
            
            context("When the fetch comics response could be parsed but response code is different that 200") {
                beforeEach {
                    let charactersResponseData = MarvelComicCharactersResponseData(results: self.characters)
                    self.remoteDataMock._fakeResponse = .success(MarvelComicCharactersResponse(code: 400, status: "", data: charactersResponseData))
                }
                it("Should call the completion block passing responseIsInvalid") {
                    waitUntil(timeout: 1) { done in
                        self.dataGateway.fetchComicCharacters(comic: self.comic) { charactersResponse in
                            let isResponseInvalid: Bool = {
                                switch charactersResponse {
                                case .failure(let error):
                                    switch error {
                                    case .responseIsInvalid:
                                        return true
                                    default:
                                        return false
                                    }
                                default:
                                    return false
                                }
                            }()
                            expect(isResponseInvalid).to(beTrue())
                            done()
                        }
                    }
                }
            }
        }
    }
    
}
