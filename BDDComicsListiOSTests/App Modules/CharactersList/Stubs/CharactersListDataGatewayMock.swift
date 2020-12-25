//
//  CharactersListDataGatewayMock.swift
//  BDDComicsListiOSTests
//
//  Created by William Hass on 2019-09-28.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
@testable import BDDComicsList

final class CharactersListDataGatewayMock {
    var _fetchComicCharactersResponseMock: FetchComicCharactersResponse?
}

// MARK: - CharactersListDataGatewayLogic
extension CharactersListDataGatewayMock: CharactersListDataGatewayLogic {
    func fetchComicCharacters(comic: Comic, completion: @escaping (FetchComicCharactersResponse)->Void) {
        if let responseMock = _fetchComicCharactersResponseMock {
            completion(responseMock)
        }
    }
}
