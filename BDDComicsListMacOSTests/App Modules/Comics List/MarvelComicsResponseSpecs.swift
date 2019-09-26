//
//  MarvelComicsResponseSpecs.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-21.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import Quick
import Nimble

class MarvelComicsResponseSpecs: QuickSpec {
    
    override func spec() {
        
        describe("MarvelComicsResponse") {
            context("When the json is valid") {
                let validJson: String = """
                {"code": 200, "status": "Ok", "data": { "results":[ {"title": "Comic title", "id": 123} ]}}
                """
                let validData = validJson.data(using: .utf8)!
                it("Should create the object properly") {
                    expect {
                        let comicsResponse = try JSONDecoder().decode(MarvelComicsResponse.self, from: validData)
                        expect(comicsResponse.code).to(equal(200))
                        expect(comicsResponse.status).to(equal("Ok"))
                        expect(comicsResponse.data.results.count).to(equal(1))
                        return comicsResponse
                        }.toNot(throwError())
                }
            }
            context("When the json is invalid") {
                let invalidJson: String = """
                {"status": "Ok", "data": {}}
                """
                let invalidData = invalidJson.data(using: .utf8)!
                it("Should trigger an error") {
                    expect {
                        try JSONDecoder().decode(MarvelComicsResponse.self, from: invalidData)
                        }.to(throwError())
                }
            }
        }
        
        describe("MarvelComicsResponseData") {
            let validJson: String = """
                { "results":[ {"title": "Comic title 1", "id": 123}, {"title": "Comic title 2", "id": 321} ]}
                """
            let validData = validJson.data(using: .utf8)!
            context("When the json is valid and there are comics") {
                it("Should create the object properly") {
                    expect {
                        let responseData = try JSONDecoder().decode(MarvelComicsResponseData.self, from: validData)
                        expect(responseData.results.count).to(equal(2))
                        expect(responseData.results[0].title).to(equal("Comic title 1"))
                        expect(responseData.results[0].id).to(equal(123))
                        expect(responseData.results[1].title).to(equal("Comic title 2"))
                        expect(responseData.results[1].id).to(equal(321))
                        return responseData
                        }.toNot(throwError())
                }
            }
            context("When the json is invalid") {
                let invalidJson: String = """
                { "blah":[]}
                """
                let invalidData = invalidJson.data(using: .utf8)!
                it("Should trigger an error") {
                    expect {
                        try JSONDecoder().decode(MarvelComicsResponseData.self, from: invalidData)
                        }.to(throwError())
                }
            }
        }
        
    }
    
}
