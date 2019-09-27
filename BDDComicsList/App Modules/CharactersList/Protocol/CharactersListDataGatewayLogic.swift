//
//  CharactersListDataGatewayLogic.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

enum FetchComicCharactersError: Error {
    case noInternetConnection
    case responseIsInvalid
}

typealias FetchComicCharactersResponse = Result<[ComicCharacter], FetchComicCharactersError>

protocol CharactersListDataGatewayLogic {
    func fetchComicCharacters(comic: Comic, completion: @escaping (FetchComicCharactersResponse)->Void)
}
