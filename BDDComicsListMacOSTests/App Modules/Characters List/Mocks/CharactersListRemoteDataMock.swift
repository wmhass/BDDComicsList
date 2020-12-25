//
//  CharactersListRemoteDataMock.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-23.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

final class CharactersListRemoteDataMock {
    var _didAskFetchAllCharacters: (didAsk: Bool, comic: Comic?) = (false, nil)
    var _fakeResponse: ComicCharactersListRemoteResponse?
}

// MARK: - CharactersListRemoteDataLogic
extension CharactersListRemoteDataMock: CharactersListRemoteDataLogic {
    func fetchAllCharacters(comic: Comic, completion: @escaping (ComicCharactersListRemoteResponse) -> Void) {
        _didAskFetchAllCharacters = (true, comic)
        if let fakeResponse = _fakeResponse {
            completion(fakeResponse)
        }
    }
}
