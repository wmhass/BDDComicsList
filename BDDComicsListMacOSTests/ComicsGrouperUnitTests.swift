//
//  ComicsGrouperUnitTests.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import Quick
import Nimble


class ComicsGrouperUnitTests: QuickSpec {
    
    override func spec() {
        describe("ComicsGrouper") {
            context("When sectioning a list of comics") {
                it("Should categorize comics in a dictionary grouped by their first letter") {
                    let comics = [
                        Comic(id: 1, title: "a comic"),
                        Comic(id: 2, title: "Another comic"),
                        Comic(id: 3, title: "Big comic"),
                        Comic(id: 4, title: "Comic"),
                        Comic(id: 5, title: "cool comic"),
                        Comic(id: 5, title: "Crook")
                    ]
                    let groupedComics = ComicsGrouper.groupedComics(fromComics: comics)
                    expect(groupedComics.keys.count).to(equal(3))

                    expect(groupedComics["a"]).toNot(beNil())
                    expect(groupedComics["a"]?.count).to(equal(2))
                    
                    expect(groupedComics["b"]).toNot(beNil())
                    expect(groupedComics["b"]?.count).to(equal(1))
                    
                    expect(groupedComics["c"]).toNot(beNil())
                    expect(groupedComics["c"]?.count).to(equal(3))
                }
            }
        }
    }
    
}
