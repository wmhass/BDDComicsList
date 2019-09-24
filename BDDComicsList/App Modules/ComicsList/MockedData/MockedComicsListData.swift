//
//  MockedComicsListData.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-23.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class MockedComicsListData {
    
}

extension MockedComicsListData: ComicsListRemoteDataLogic {
    func fetchAllComics(completion: @escaping (ComicsListRemoteResponse) -> Void) {
        let fileURL = Bundle.main.url(forResource: "mocked_comics", withExtension: "json")!
        let data = try! Data(contentsOf: fileURL)
        let marvelResponse = try! JSONDecoder().decode(MarvelComicsResponse.self, from: data)
        completion(ComicsListRemoteResponse.success(response: marvelResponse))
    }
}
