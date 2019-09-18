//
//  ComicsListInteractor.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-18.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

protocol ComicsListBusinessLogic {
    func loadListOfComics()
}

class ComicsListInteractor {

    let presenter: ComicsListPresentationLogic

    init(presenter: ComicsListPresentationLogic) {
        self.presenter = presenter
    }
}

extension ComicsListInteractor: ComicsListBusinessLogic {
    func loadListOfComics() {
        
    }
}
