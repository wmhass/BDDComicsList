//
//  ComicsListRemoteDataMock.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-21.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class ComicsListRemoteDataMock {
    var _didAskFetchAllComics: Bool = false
    var _fakeResponse: ComicsListRemoteResponse?
}

extension ComicsListRemoteDataMock: ComicsListRemoteDataLogic {
    func fetchAllComics(completion: @escaping (ComicsListRemoteResponse) -> Void) {
        _didAskFetchAllComics = true
        if let fakeResponse = _fakeResponse {
            completion(fakeResponse)
        }
    }
}
