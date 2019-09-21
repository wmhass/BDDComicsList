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

    init(marvelAPIURLBuilder: MarvelAPIURLBuilder) {
        self.marvelAPIURLBuilder = marvelAPIURLBuilder
    }
}

extension ComicsListRemoteData: ComicsListRemoteDataLogic {
    func fetchAllComics(completion: @escaping (ComicsListRemoteResponse) -> Void) {
        let urlRequest = URLRequest(url: self.marvelAPIURLBuilder.comicsListURL(limit: 5))
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
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
        dataTask.resume()
    }
}
