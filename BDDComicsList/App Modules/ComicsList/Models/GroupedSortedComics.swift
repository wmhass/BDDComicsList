//
//  GroupedSortedComics.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-20.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

typealias ComicTitleFirstLetter = String
typealias GroupedComics = [ComicTitleFirstLetter: [Comic]]

struct GroupedSortedComics {
    
    let sortedKeys: [ComicTitleFirstLetter]
    let groupedComics: [ComicTitleFirstLetter: [Comic]]
    
    init(comics: [Comic]) {
        let groupedComics = comics.sorted {
            $0.title.lowercased() < $1.title.lowercased()
            }.reduce(into: [ComicTitleFirstLetter: [Comic]](), { (result, comic) in
                guard let firstLetter = comic.title.first?.lowercased() else { return }
                if var comicsGroup = result[firstLetter]  {
                    comicsGroup.append(comic)
                    result[firstLetter] = comicsGroup
                } else {
                    result[firstLetter] = [comic]
                }
            })
        self.groupedComics = groupedComics
        self.sortedKeys = groupedComics.keys.sorted(by: <)
    }
}

extension GroupedSortedComics: Equatable {
    static func == (lhs: GroupedSortedComics, rhs: GroupedSortedComics) -> Bool {
        return lhs.sortedKeys == rhs.sortedKeys &&
            lhs.groupedComics == rhs.groupedComics
    }
}
