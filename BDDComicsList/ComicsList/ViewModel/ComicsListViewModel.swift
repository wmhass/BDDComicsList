//
//  ComicsListViewModel.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-20.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

struct ComicsListViewModel {
    
    fileprivate let groupedComics: GroupedComics

    init(groupedComics: GroupedComics) {
        self.groupedComics = groupedComics
    }
}
