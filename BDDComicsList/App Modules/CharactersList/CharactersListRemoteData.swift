//
//  CharactersListRemoteData.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

final class CharactersListRemoteData {
    let marvelAPIURLBuilder: MarvelAPIURLBuilder
    let httpDataLoader: HTTPDataLoaderLogic
    
    init(marvelAPIURLBuilder: MarvelAPIURLBuilder, httpDataLoader: HTTPDataLoaderLogic) {
        self.marvelAPIURLBuilder = marvelAPIURLBuilder
        self.httpDataLoader = httpDataLoader
    }
}

// MARK: - CharactersListRemoteDataLogic
extension CharactersListRemoteData: CharactersListRemoteDataLogic {
    func fetchAllCharacters(comic: Comic, completion: @escaping (ComicCharactersListRemoteResponse) -> Void) {
        let urlRequest = URLRequest(url: self.marvelAPIURLBuilder.charactersListURL(comicID: comic.id))
        self.httpDataLoader.loadData(withRequest: urlRequest) { (data, urlResponse, error) in
            if let data = data {
                do {
                    let marvelResponse = try JSONDecoder().decode(MarvelComicCharactersResponse.self, from: data)
                    completion(.success(marvelResponse))
                } catch {
                    completion(.failure(.failedParsingData))
                }
            } else {
                completion(.failure(.failedParsingData))
            }
        }
    }
}
