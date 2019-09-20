//
//  ComicsListViewModelUnitTests.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-20.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import Quick
import Nimble

class ComicsListViewModelUnitTests: QuickSpec {
    
    var viewModel: ComicsListViewModel!
    var groupedComics: GroupedComics = [
        "a": [
            Comic(id: 123, title: "Avengers"),
            Comic(id: 234, title: "Aero")
        ],
        "b": [
            Comic(id: 345, title: "Black Cat"),
            Comic(id: 456, title: "Black Panther")
        ],
        "c": [
            Comic(id: 567, title: "Capitain America"),
            Comic(id: 567, title: "Champions"),
            Comic(id: 678, title: "Conan the Barbarian"),
        ],
        "l": [
            Comic(id: 789, title: "Loki")
        ],
        "t": [
            Comic(id: 890, title: "The Punisher")
        ]
    ]
    
    
    override func spec() {
        beforeSuite {
            self.viewModel = ComicsListViewModel(groupedComics: self.groupedComics)
        }
        describe("ComicsListViewModel") {
            context("When asked the number of sections") {
                it("Should return the number of comics group (grouped by first letter)") {
                    
                }
            }
            context("When asked for the number of items in a given section") {
                it("Should return the correct number of comics in the given section") {
                    
                }
            }
            context("When asked for the title of a given comic in a given section") {
                it("Should return the title of the comic in that position sorted ascending") {
                    
                }
            }
            context("When asked for the title of a given section") {
                it("Should return the lowercased section letter sorted ascending") {
                    
                }
            }
            context("When asking for the comic for selection at a giving index path") {
                it("Should return the correct Comic model") {
                    
                }
            }
        }
        
    }
    
}
