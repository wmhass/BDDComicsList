//
//  ComicsListDataGateway.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-18.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class ComicsListDataGateway {
    // As this is a sample project and we are not using any networking library, we will mock this value here just for educational purpose, but Ideally, we would use some kind of reachability component
    var hasInternetConnection: Bool = true
    let remoteData: ComicsListRemoteDataLogic
    
    init(remoteData: ComicsListRemoteDataLogic) {
        self.remoteData = remoteData
    }
}

extension ComicsListDataGateway: ComicsListDataGatewayLogic {
    func fetchComics(completion: @escaping (FetchComicsResponse)->Void) {
        guard self.hasInternetConnection else {
            return completion(.failure(.noInternetConnection))
        }
        self.remoteData.fetchAllComics { remoteResponse in
            switch remoteResponse {
            case .failedParsingData:
                completion(.failure(.responseIsInvalid))
            case .success(let response):
                if response.code == 200 {
                    completion(.success(response.data.results))
                } else {
                    completion(.failure(.responseIsInvalid))
                }
            }
        }
    }
}
