//
//  CharactersListDataGateway.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class CharactersListDataGateway {
    // As this is a sample project and we are not using any networking library, we will mock this value here just for educational purpose, but Ideally, we would use some kind of reachability component
    var hasInternetConnection: Bool = true
    let remoteData: CharactersListRemoteDataLogic

    init(remoteData: CharactersListRemoteDataLogic) {
        self.remoteData = remoteData
    }
}

extension CharactersListDataGateway: CharactersListDataGatewayLogic {
    func fetchComicCharacters(comic: Comic, completion: @escaping (FetchComicCharactersResponse) -> Void) {
        guard self.hasInternetConnection else {
            return completion(.failure(.noInternetConnection))
        }
        self.remoteData.fetchAllCharacters(comic: comic) { remoteResponse in
            switch remoteResponse {
            case .failedParsingData:
                completion(.failure(.responseIsInvalid))
            case .success(let response):
                if response.code == 200 {
                    completion(FetchComicCharactersResponse.success(response.data.results))
                } else {
                    completion(.failure(.responseIsInvalid))
                }
            }
        }
    }
}
