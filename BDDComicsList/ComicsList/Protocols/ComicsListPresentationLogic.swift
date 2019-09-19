//
//  ComicsListPresentationLogic.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-18.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

typealias ComicTitleFirstLetter = String
typealias SectionedComics = [ComicTitleFirstLetter: Comic]

protocol ComicsListPresentationLogic {
    func presentResponseIsInvalid()
    func presentNoInternetConnectionErrorMessage()
    func presentFetchDataActivityIndicator(_ shouldPresent: Bool)
    func presentComics(sectionedComics: SectionedComics)
}
