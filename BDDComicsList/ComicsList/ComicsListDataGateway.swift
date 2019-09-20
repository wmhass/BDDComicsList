//
//  ComicsListDataGateway.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-18.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class ComicsListDataGateway {
    // As this is a sample project and we are not using any networking library, we will mock this value here just for educational purpose
    var hasInternetConnection: Bool = true
}

extension ComicsListDataGateway: ComicsListDataGatewayLogic {
    func fetchComics(completion: @escaping (FetchComicsResponse)->Void) {
        
    }
}
