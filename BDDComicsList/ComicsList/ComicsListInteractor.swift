//
//  ComicsListInteractor.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-18.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class ComicsListInteractor {

    let presenter: ComicsListPresentationLogic
    let dataGateway: ComicsListDataGatewayLogic
    
    init(presenter: ComicsListPresentationLogic, dataGateway: ComicsListDataGatewayLogic) {
        self.presenter = presenter
        self.dataGateway = dataGateway
    }
}

extension ComicsListInteractor: ComicsListBusinessLogic {
    func loadListOfComics() {
        self.dataGateway.fetchComics { fetchComicsResponse in

        }
    }
}
