//
//  CharactersListDataGatewayMock.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class CharactersListDataGatewayMock {
    var _fetchComicCharactersResponseMock: FetchComicCharactersResponse?
    var _didAttemptToFetchComicCharacters: Bool = false
}

extension CharactersListDataGatewayMock: CharactersListDataGatewayLogic {
    func fetchComicCharacters(comic: Comic, completion: @escaping (FetchComicCharactersResponse) -> Void) {
        _didAttemptToFetchComicCharacters = true
        if let responseMock = _fetchComicCharactersResponseMock {
            completion(responseMock)
        }
    }
}
