//
//  ComicSpec.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-21.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import Quick
import Nimble

class ComicSpec: QuickSpec {
    
    override func spec() {
        describe("Comic") {
            context("When the json is valid") {
                let validJson = """
                {"title": "Avengers", "id": 123}
                """
                let validData = validJson.data(using: .utf8)!
                it("Should properly create the comic object") {
                    expect {
                        let comic = try JSONDecoder().decode(Comic.self, from: validData)
                        expect(comic.title).to(equal("Avengers"))
                        expect(comic.id).to(equal(123))
                        return comic
                        }.toNot(throwError())
                }
            }
            context("When the json is invalid") {
                let validJson = """
                {"title": 2234, "id": "asd"}
                """
                let validData = validJson.data(using: .utf8)!
                it("Should throw an error") {
                    expect {
                        try JSONDecoder().decode(Comic.self, from: validData)
                        }.to(throwError())
                }
            }
        }
    }
    
}
