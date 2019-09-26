//
//  MarvelComicCharactersResponseSpecs.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-23.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import Quick
import Nimble

class MarvelComicCharactersResponseSpecs: QuickSpec {
    
    override func setUp() {
        describe("MarvelComicCharactersResponse") {
            context("When the json is valid") {
                let validJson: String = """
                {"code": 200, "status": "Ok", "data": { "results":[ {"name": "Ant-men", "id": 123} ]}}
                """
                let validData = validJson.data(using: .utf8)!
                it("Should create the object properly") {
                    expect {
                        let comicsResponse = try JSONDecoder().decode(MarvelComicCharactersResponse.self, from: validData)
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
                        try JSONDecoder().decode(MarvelComicCharactersResponse.self, from: invalidData)
                        }.to(throwError())
                }
            }
        }
        
        describe("MarvelComicsResponseData") {
            let validJson: String = """
                { "results":[ {"name": "Ant-Man", "id": 123}, {"name": "Hulk", "id": 321} ]}
                """
            let validData = validJson.data(using: .utf8)!
            context("When the json is valid and there are characters") {
                it("Should create the object properly") {
                    expect {
                        let responseData = try JSONDecoder().decode(MarvelComicCharactersResponseData.self, from: validData)
                        expect(responseData.results.count).to(equal(2))
                        expect(responseData.results[0].name).to(equal("Ant-Man"))
                        expect(responseData.results[0].id).to(equal(123))
                        expect(responseData.results[1].name).to(equal("Hulk"))
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
