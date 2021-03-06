//
//  ComicsListPresentationLogic.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-18.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

protocol ComicsListPresentationLogic: class {
    func presentResponseIsInvalid()
    func presentNoInternetConnectionErrorMessage()
    func presentFetchDataActivityIndicator(_ shouldPresent: Bool)
    func presentComics(groupedComics: GroupedSortedComics)
    func presentCharacters(ofComic comic: Comic)
}
