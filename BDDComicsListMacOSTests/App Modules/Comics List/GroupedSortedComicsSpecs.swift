//
//  GroupedSortedComicsSpecs.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import Quick
import Nimble


class GroupedSortedComicsSpecs: QuickSpec {
    
    var groupedSortedComics: GroupedSortedComics!
    
    override func spec() {
        let comics = [
            Comic(id: 4, title: "Comic"),
            Comic(id: 1, title: "Aaa comic"),
            Comic(id: 2, title: "Abb comic"),
            Comic(id: 5, title: "Crook"),
            Comic(id: 3, title: "Big comic"),
            Comic(id: 5, title: "cool comic"),
        ]
        self.groupedSortedComics = GroupedSortedComics(comics: comics)
        describe("GroupedSortedComics") {
            context("When grouping and sorting a list of comics") {
                it("Should categorize comics in a dictionary grouped by their first letter") {
                    let groupedComics = self.groupedSortedComics.groupedComics

                    expect(groupedComics.keys.count).to(equal(3))

                    expect(groupedComics["a"]).toNot(beNil())
                    expect(groupedComics["a"]?.count).to(equal(2))
                    
                    expect(groupedComics["b"]).toNot(beNil())
                    expect(groupedComics["b"]?.count).to(equal(1))
                    
                    expect(groupedComics["c"]).toNot(beNil())
                    expect(groupedComics["c"]?.count).to(equal(3))
                }
                it("Should sort categories ascending") {
                    let orderedSections = self.groupedSortedComics.sortedKeys
                    expect(orderedSections[0]).to(equal("a"))
                    expect(orderedSections[1]).to(equal("b"))
                    expect(orderedSections[2]).to(equal("c"))
                }
                it("Should sort comics by the first title letter ascending") {
                    let letterASection = self.groupedSortedComics.groupedComics["a"]!
                    expect(letterASection[0].title).to(equal("Aaa comic"))
                    expect(letterASection[1].title).to(equal("Abb comic"))
                    
                    let letterCSection = self.groupedSortedComics.groupedComics["c"]!
                    expect(letterCSection[0].title).to(equal("Comic"))
                    expect(letterCSection[1].title).to(equal("cool comic"))
                    expect(letterCSection[2].title).to(equal("Crook"))
                }
            }
        }
    }
    
}
