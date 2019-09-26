//
//  MockedCharactersListData.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-23.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class MockedCharactersListData {
    
}

extension MockedCharactersListData: CharactersListRemoteDataLogic {
    func fetchAllCharacters(comic: Comic, completion: @escaping (ComicCharactersListRemoteResponse) -> Void) {
        let fileURL = Bundle.main.url(forResource: "mocked_characters", withExtension: "json")!
        let data = try! Data(contentsOf: fileURL)
        let marvelResponse = try! JSONDecoder().decode(MarvelComicCharactersResponse.self, from: data)
        completion(ComicCharactersListRemoteResponse.success(response: marvelResponse))
    }
}
