//
//  ComicsListDataGatewayMock.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class ComicsListDataGatewayMock {
    var _fetchComicsResultMock: FetchComicsResponse?
}

extension ComicsListDataGatewayMock: ComicsListDataGatewayLogic {
    func fetchComics(completion: @escaping (FetchComicsResponse)->Void) {
        if let resultMock = _fetchComicsResultMock {
            completion(resultMock)
        }
    }
}
