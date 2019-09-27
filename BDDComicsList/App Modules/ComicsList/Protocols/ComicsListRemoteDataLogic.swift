//
//  ComicsListRemoteDataLogic.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-21.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

struct MarvelComicsResponseData: Decodable {
    let results: [Comic]
}

struct MarvelComicsResponse: Decodable {
    let code: Int
    let status: String
    let data: MarvelComicsResponseData
}

enum ComicsListRemoteError: Error {
    case failedParsingData
}

typealias ComicsListRemoteResponse = Result<MarvelComicsResponse,ComicsListRemoteError>

protocol ComicsListRemoteDataLogic {
    func fetchAllComics(completion: @escaping (ComicsListRemoteResponse) -> Void)
}
