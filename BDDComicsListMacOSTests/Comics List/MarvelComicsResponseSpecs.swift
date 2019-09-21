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
                        try JSONDecoder().decode(MarvelComicsResponse.self, from: validData)
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
                { "results":[ {"title": "Comic title", "id": 123} ]}
                """
            let validData = validJson.data(using: .utf8)!
            context("When the json is valid and there are comics") {
                it("Should create the object properly") {
                    expect {
                        try JSONDecoder().decode(MarvelComicsResponseData.self, from: validData)
                        }.toNot(throwError())
                }
            }
            context("When the json is invalid and there are comics") {
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
