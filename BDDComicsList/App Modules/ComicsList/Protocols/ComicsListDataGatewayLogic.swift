//
//  ComicsListDataGatewayLogic.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-18.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

enum FetchComicsError: Error {
    case noInternetConnection
    case responseIsInvalid
}

typealias FetchComicsResponse = Result<[Comic], FetchComicsError>

protocol ComicsListDataGatewayLogic {
    func fetchComics(completion: @escaping (FetchComicsResponse)->Void)
}
