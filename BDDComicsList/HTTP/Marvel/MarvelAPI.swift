//
//  MarvelAPI.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-21.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

struct MarvelAPICredentials {
    static var defaultKeys: MarvelAPIKeys {
       return MarvelAPIKeys(apiKey: "c30da7627124e15b822feab8201b7409", hash: "409dfdf1cfe5bf0c82914f1afae7b51e", ts: "1")
    }
}

enum MarvelAPIInformation: String {
    case scheme = "https"
    case host = "gateway.marvel.com"
    case apiPath = "/v1/public"
}

struct MarvelAPIKeys {
    let apiKey: String
    let hash: String
    let ts: String
}

enum MarvelEndpoint: String {
    case comics = "comics"
}

enum MarvelQueryParameters: String {
    case apikey = "apikey"
    case hash = "hash"
    case timestamp = "ts"
    case limit = "limit"
}

extension URLQueryItem {
    init(marvelLimit: Int) {
        self.init(name: MarvelQueryParameters.limit.rawValue, value: "\(marvelLimit)")
    }
}

struct MarvelAPIURLBuilder {
    
    let apiKeys: MarvelAPIKeys
    
    private func marvelURL(endpoint: MarvelEndpoint, queryItems: [URLQueryItem]? = nil) -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = MarvelAPIInformation.scheme.rawValue
        urlComponents.host = MarvelAPIInformation.host.rawValue
        urlComponents.path = "\(MarvelAPIInformation.apiPath.rawValue)/\(endpoint.rawValue)"
        
        var defaultQueryItems = [
            URLQueryItem(name: MarvelQueryParameters.apikey.rawValue, value: self.apiKeys.apiKey),
            URLQueryItem(name: MarvelQueryParameters.hash.rawValue, value: self.apiKeys.hash),
            URLQueryItem(name: MarvelQueryParameters.timestamp.rawValue, value: self.apiKeys.ts)
        ]
        if let queryItems = queryItems {
            defaultQueryItems.append(contentsOf: queryItems)
        }
        urlComponents.queryItems = defaultQueryItems
        return urlComponents
    }
    
    
    func comicsListURL(limit: Int) -> URL {
        return self.marvelURL(endpoint: .comics, queryItems: [URLQueryItem(marvelLimit: limit)]).url!
    }
}
