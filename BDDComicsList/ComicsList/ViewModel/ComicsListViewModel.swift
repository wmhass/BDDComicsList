//
//  ComicsListViewModel.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-20.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

struct ComicsListViewModel {
    
    fileprivate let comics: GroupedSortedComics

    init(groupedComics: GroupedSortedComics) {
        self.comics = groupedComics
    }
}

extension ComicsListViewModel: ComicsListViewModelLogic {
    var numberOfSections: Int {
        return self.comics.sortedKeys.count
    }
    func numberOfComics(inSection section: Int) -> Int {
        guard self.comics.sortedKeys.indices.contains(section) else {
            return 0
        }
        let sectionKey = self.comics.sortedKeys[section]
        return self.comics.groupedComics[sectionKey]?.count ?? 0
    }
    func titleOfSection(atIndex sectionIndex: Int) -> String? {
        guard self.comics.sortedKeys.indices.contains(sectionIndex) else {
            return nil
        }
        return self.comics.sortedKeys[sectionIndex].uppercased()
    }
    func titleOfComic(atIndex index: Int, inSection sectionIndex: Int) -> String? {
        guard self.comics.sortedKeys.indices.contains(sectionIndex) else {
            return nil
        }
        let key = self.comics.sortedKeys[sectionIndex]
        guard let comics = self.comics.groupedComics[key],
        comics.indices.contains(index) else {
            return nil
        }
        return comics[index].title
    }
    func comicForSelection(atIndex index: Int, inSection sectionIndex: Int) -> Comic? {
        guard self.comics.sortedKeys.indices.contains(sectionIndex) else {
            return nil
        }
        let key = self.comics.sortedKeys[sectionIndex]
        guard let comics = self.comics.groupedComics[key],
            comics.indices.contains(index) else {
                return nil
        }
        return comics[index]
    }
}
