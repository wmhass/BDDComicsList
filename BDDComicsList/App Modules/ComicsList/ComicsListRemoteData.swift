//
//  ComicsListRemoteData.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-21.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class ComicsListRemoteData {

    let marvelAPIURLBuilder: MarvelAPIURLBuilder
    let httpDataLoader: HTTPDataLoaderLogic
    
    init(marvelAPIURLBuilder: MarvelAPIURLBuilder, httpDataLoader: HTTPDataLoaderLogic) {
        self.marvelAPIURLBuilder = marvelAPIURLBuilder
        self.httpDataLoader = httpDataLoader
    }
}

extension ComicsListRemoteData: ComicsListRemoteDataLogic {
    func fetchAllComics(completion: @escaping (ComicsListRemoteResponse) -> Void) {
        let urlRequest = URLRequest(url: self.marvelAPIURLBuilder.comicsListURL(limit: 5))
        self.httpDataLoader.loadData(withRequest: urlRequest) { (data, urlResponse, error) in
            if let data = data {
                do {
                    let marvelResponse = try JSONDecoder().decode(MarvelComicsResponse.self, from: data)
                    completion(ComicsListRemoteResponse.success(response: marvelResponse))
                } catch {
                    completion(ComicsListRemoteResponse.failedParsingData)
                }
            } else {
                completion(ComicsListRemoteResponse.failedParsingData)
            }
        }
    }
}
