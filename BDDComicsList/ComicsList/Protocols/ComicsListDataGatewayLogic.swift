//
//  ComicsListDataGatewayLogic.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-18.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

enum FetchComicsResponse {
    case noInternetConnection
    case responseIsInvalid
    case success(comics: [Comic])
}

protocol ComicsListDataGatewayLogic {
    func fetchComics(completion: @escaping (FetchComicsResponse)->Void)
}
