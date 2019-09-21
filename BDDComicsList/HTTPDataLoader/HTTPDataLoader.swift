//
//  HTTPDataLoader.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-21.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

protocol HTTPDataLoaderLogic {
    func loadData(withRequest urlRquest: URLRequest, completion: @escaping (Data?, URLResponse?, Error?)-> Void)
}

struct HTTPDataLoader {
    
}

extension HTTPDataLoader: HTTPDataLoaderLogic {
    func loadData(withRequest urlRequest: URLRequest, completion: @escaping (Data?, URLResponse?, Error?)-> Void) {
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            completion(data, urlResponse, error)
        }
        dataTask.resume()
    }
}
