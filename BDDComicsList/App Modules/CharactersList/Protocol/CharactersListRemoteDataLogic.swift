//
//  CharactersListRemoteDataLogic.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

struct MarvelComicCharactersResponseData: Decodable {
    let results: [ComicCharacter]
}

// TODO: Can use generics here to `data`
struct MarvelComicCharactersResponse: Decodable {
    let code: Int
    let status: String
    let data: MarvelComicCharactersResponseData
}

enum ComicCharactersListRemoteError: Error {
    case failedParsingData
}

typealias ComicCharactersListRemoteResponse = Result<MarvelComicCharactersResponse, ComicCharactersListRemoteError>

protocol CharactersListRemoteDataLogic {
    func fetchAllCharacters(comic: Comic, completion: @escaping (ComicCharactersListRemoteResponse) -> Void)
}
