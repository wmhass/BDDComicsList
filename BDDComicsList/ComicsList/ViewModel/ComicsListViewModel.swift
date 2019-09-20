//
//  ComicsListViewModel.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-20.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

struct ComicsListViewModel {
    
    fileprivate let groupedComics: GroupedSortedComics

    init(groupedComics: GroupedSortedComics) {
        self.groupedComics = groupedComics
    }
}

extension ComicsListViewModel: ComicsListViewModelLogic {
    
}
