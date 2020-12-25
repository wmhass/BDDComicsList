//
//  ComicsListDataGatewayMock.swift
//  BDDComicsListiOSTests
//
//  Created by William Hass on 2019-09-27.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
@testable import BDDComicsList

final class ComicsListDataGatewayMock {
    var _fetchComicsResponseMock: FetchComicsResponse?
    
}

// MARK: - ComicsListDataGatewayLogic
extension ComicsListDataGatewayMock: ComicsListDataGatewayLogic {
    func fetchComics(completion: @escaping (FetchComicsResponse)->Void) {
        if let responseMock = _fetchComicsResponseMock {
            completion(responseMock)
        }
    }
}
