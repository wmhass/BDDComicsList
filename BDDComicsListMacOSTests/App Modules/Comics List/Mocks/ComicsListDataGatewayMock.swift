//
//  ComicsListDataGatewayMock.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

final class ComicsListDataGatewayMock {
    var _fetchComicsResponseMock: FetchComicsResponse?
    var _didAttemptToFetchComics: Bool = false
}

// MARK: - ComicsListDataGatewayLogic
extension ComicsListDataGatewayMock: ComicsListDataGatewayLogic {
    func fetchComics(completion: @escaping (FetchComicsResponse)->Void) {
        _didAttemptToFetchComics = true
        if let responseMock = _fetchComicsResponseMock {
            completion(responseMock)
        }
    }
}
