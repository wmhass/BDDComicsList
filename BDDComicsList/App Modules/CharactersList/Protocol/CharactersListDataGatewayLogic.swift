//
//  CharactersListDataGatewayLogic.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

enum FetchComicCharactersResponse {
    case noInternetConnection
    case responseIsInvalid
    case success(characters: [Any])
}

protocol CharactersListDataGatewayLogic {
    func fetchComicCharacters(comic: Comic, completion: @escaping (FetchComicCharactersResponse)->Void)
}
