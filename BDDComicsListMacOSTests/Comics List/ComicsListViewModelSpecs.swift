//
//  ComicsListViewModelSpecs.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-20.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import Quick
import Nimble

class ComicsListViewModelSpecs: QuickSpec {
    
    var viewModel: ComicsListViewModel!
    let comics = [
        Comic(id: 4, title: "Comic"),
        Comic(id: 1, title: "Aaa comic"),
        Comic(id: 2, title: "Abb comic"),
        Comic(id: 5, title: "Crook"),
        Comic(id: 3, title: "Big comic"),
        Comic(id: 5, title: "cool comic"),
    ]

    override func spec() {
        beforeSuite {
            let groupedSortedComics = GroupedSortedComics(comics: self.comics)
            self.viewModel = ComicsListViewModel(groupedComics: groupedSortedComics)
        }
        describe("ComicsListViewModel") {
            context("When asked the number of sections") {
                it("Should return the number of comics group (grouped by first letter)") {
                    expect(self.viewModel.numberOfSections).to(equal(3))
                }
            }
            context("When asked for the title of a given section") {
                it("Should return the uppercased section letter sorted ascending") {
                    expect(self.viewModel.titleOfSection(atIndex: 0)).to(equal("A"))
                    expect(self.viewModel.titleOfSection(atIndex: 1)).to(equal("B"))
                    expect(self.viewModel.titleOfSection(atIndex: 2)).to(equal("C"))
                    expect(self.viewModel.titleOfSection(atIndex: 3)).to(beNil())
                }
            }
            context("When asked for the number of items in a given section") {
                it("Should return the correct number of comics in the given section") {
                    expect(self.viewModel.numberOfComics(inSection: 0)).to(equal(2))
                    expect(self.viewModel.numberOfComics(inSection: 1)).to(equal(1))
                    expect(self.viewModel.numberOfComics(inSection: 2)).to(equal(3))
                }
            }
            context("When asked for the title of a given comic in a given section") {
                it("Should return the title of the comic in that position sorted ascending") {
                    // "a"
                    expect(self.viewModel.titleOfComic(atIndex: 0, inSection: 0)).to(equal("Aaa comic"))
                    expect(self.viewModel.titleOfComic(atIndex: 1, inSection: 0)).to(equal("Abb comic"))
                    expect(self.viewModel.titleOfComic(atIndex: 2, inSection: 0)).to(beNil())
                    // "b"
                    expect(self.viewModel.titleOfComic(atIndex: 0, inSection: 1)).to(equal("Big comic"))
                    expect(self.viewModel.titleOfComic(atIndex: 1, inSection: 1)).to(beNil())
                    // "a"
                    expect(self.viewModel.titleOfComic(atIndex: 0, inSection: 2)).to(equal("Comic"))
                    expect(self.viewModel.titleOfComic(atIndex: 1, inSection: 2)).to(equal("cool comic"))
                    expect(self.viewModel.titleOfComic(atIndex: 2, inSection: 2)).to(equal("Crook"))
                    expect(self.viewModel.titleOfComic(atIndex: 3, inSection: 2)).to(beNil())
                }
            }
            context("When asking for the comic for selection at a giving index path") {
                it("Should return the correct Comic model") {
                    // "a"
                    expect(self.viewModel.comic(atIndex: 0, inSection: 0)).to(equal(self.comics[1]))
                    expect(self.viewModel.comic(atIndex: 1, inSection: 0)).to(equal(self.comics[2]))
                    expect(self.viewModel.comic(atIndex: 2, inSection: 0)).to(beNil())
                    // "b"
                    expect(self.viewModel.comic(atIndex: 0, inSection: 1)).to(equal(self.comics[4]))
                    expect(self.viewModel.comic(atIndex: 1, inSection: 1)).to(beNil())
                    // "a"
                    expect(self.viewModel.comic(atIndex: 0, inSection: 2)).to(equal(self.comics[0]))
                    expect(self.viewModel.comic(atIndex: 1, inSection: 2)).to(equal(self.comics[5]))
                    expect(self.viewModel.comic(atIndex: 2, inSection: 2)).to(equal(self.comics[3]))
                    expect(self.viewModel.comic(atIndex: 3, inSection: 2)).to(beNil())
                }
            }
        }
        
    }
    
}
