//
//  CharactersListInteractor.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class CharactersListInteractor {

    let comic: Comic
    let dataGateway: CharactersListDataGatewayLogic
    weak var presentation: CharactersListPresentationLogic?

    init(comic: Comic, dataGateway: CharactersListDataGatewayLogic) {
        self.comic = comic
        self.dataGateway = dataGateway
    }
}

extension CharactersListInteractor: CharactersListBusinessLogic {
    func loadListOfCharacters() {
        self.presentation?.presentFetchDataActivityIndicator(true)
        self.dataGateway.fetchComicCharacters(comic: self.comic) { response in

        }
    }
}
