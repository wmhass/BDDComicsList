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
    case failed(message: String)
    case success(comics: Any)
}

protocol ComicsListDataGatewayLogic {
    func fetchComics(completion: @escaping (FetchComicsResponse)->Void)
}
