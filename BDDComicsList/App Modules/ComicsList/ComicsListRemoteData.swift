//
//  ComicsListRemoteData.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-21.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

final class ComicsListRemoteData {
    let marvelAPIURLBuilder: MarvelAPIURLBuilder
    let httpDataLoader: HTTPDataLoaderLogic
    
    init(marvelAPIURLBuilder: MarvelAPIURLBuilder, httpDataLoader: HTTPDataLoaderLogic) {
        self.marvelAPIURLBuilder = marvelAPIURLBuilder
        self.httpDataLoader = httpDataLoader
    }
}

extension URL {
    var request: URLRequest {
        return URLRequest(url: self)
    }
}

extension ComicsListRemoteData: ComicsListRemoteDataLogic {
    func fetchAllComics(completion: @escaping (ComicsListRemoteResponse) -> Void) {
        let comicsListRequest = self.marvelAPIURLBuilder.comicsListURL(limit: 5).request
        self.httpDataLoader.loadData(withRequest: comicsListRequest) { (data, urlResponse, error) in
            guard let data = data else {
                completion(.failure(.failedParsingData))
                return
            }
            
            do {
                let marvelResponse = try JSONDecoder().decode(MarvelComicsResponse.self, from: data)
                completion(.success(marvelResponse))
            } catch {
                completion(.failure(.failedParsingData))
            }
        }
    }
}
