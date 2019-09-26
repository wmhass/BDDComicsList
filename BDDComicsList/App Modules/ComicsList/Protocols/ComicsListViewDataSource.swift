//
//  ComicsListViewDataSource.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

protocol ComicsListViewDataSource {
    var numberOfSections: Int { get }
    func numberOfComics(inSection section: Int) -> Int
    func titleOfSection(atIndex sectionIndex: Int) -> String?
    func titleOfComic(atIndex index: Int, inSection sectionIndex: Int) -> String?
}
