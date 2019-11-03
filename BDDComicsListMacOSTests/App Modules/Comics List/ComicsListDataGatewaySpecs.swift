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

final class ComicsListDataGatewaySpecs: QuickSpec {
    
    var dataGateway: ComicsListDataGateway!
    let remoteDataMock: ComicsListRemoteDataMock = ComicsListRemoteDataMock()
    
    override func spec() {
        beforeSuite {
            self.dataGateway = ComicsListDataGateway(remoteData: self.remoteDataMock)
        }
        
        describe("Given that I don't have internet connection") {
            beforeEach {
                self.dataGateway.hasInternetConnection = false
            }
            context("When trying to fetch comics") {
                it("Should call the completion block passing noInternetConnection result") {
                    waitUntil(timeout: 1) { done in
                        self.dataGateway.fetchComics { comicsResponse in
                            let isNoInternetConnection: Bool = {
                                switch comicsResponse {
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
                    self.remoteDataMock._didAskFetchAllComics = false
                    self.dataGateway.fetchComics{ _ in }
                }
                it("Should ask the remote data for the comics") {
                    expect(self.remoteDataMock._didAskFetchAllComics).to(beTrue())
                }
            }
            context("When the fetch comics response could not be parsed") {
                beforeEach {
                    self.remoteDataMock._fakeResponse = .failure(.failedParsingData)
                }
                it("Should call the completion block passing responseIsInvalid") {
                    waitUntil(timeout: 1) { done in
                        self.dataGateway.fetchComics { comicsResponse in
                            let isResponseInvalid: Bool = {
                                switch comicsResponse {
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
                    let comics = [Comic(id: 10, title: "C1"),Comic(id: 11, title: "C2")]
                    let comicsResponseData = MarvelComicsResponseData(results: comics)

                    self.remoteDataMock._fakeResponse = .success(MarvelComicsResponse(code: 200, status: "", data: comicsResponseData))
                }
                it("Should call the completion block passing the comics") {
                    waitUntil(timeout: 1) { done in
                        self.dataGateway.fetchComics { comicsResponse in
                            let isResponseValid: Bool = {
                                switch comicsResponse {
                                case .success(_): return true
                                default: return false
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
                    let comicsResponseData = MarvelComicsResponseData(results: [])
                    self.remoteDataMock._fakeResponse = .success(MarvelComicsResponse(code: 400, status: "", data: comicsResponseData))
                }
                it("Should call the completion block passing responseIsInvalid") {
                    waitUntil(timeout: 1) { done in
                        self.dataGateway.fetchComics { comicsResponse in
                            let isResponseInvalid: Bool = {
                                switch comicsResponse {
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
