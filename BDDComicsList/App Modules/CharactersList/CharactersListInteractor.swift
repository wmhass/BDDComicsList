//
//  CharactersListInteractor.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

final class CharactersListInteractor {
    let comic: Comic
    let dataGateway: CharactersListDataGatewayLogic
    weak var presentation: CharactersListPresentationLogic?

    init(comic: Comic, dataGateway: CharactersListDataGatewayLogic) {
        self.comic = comic
        self.dataGateway = dataGateway
    }
}

// MARK: - Private methods
extension CharactersListInteractor {
    // Imagine this one day this sorting algorithm
    // can become as complex as Google's ranking...
    // Would it make sense to have this abstracted?
    // Or maybe you want a exclusive team to handle
    // the order algorithm
    private func sort(_ characters: [ComicCharacter]) -> [ComicCharacter] {
        return characters.sorted { (c1, c2) -> Bool in
            return c1.name.lowercased() < c2.name.lowercased()
        }
    }
}

// MARK: - CharactersListBusinessLogic
extension CharactersListInteractor: CharactersListBusinessLogic {
    func loadListOfCharacters() {
        self.presentation?.presentFetchDataActivityIndicator(true)
        self.dataGateway.fetchComicCharacters(comic: self.comic) { response in
            self.presentation?.presentFetchDataActivityIndicator(false)
            switch response {
            case .failure(let error):
                switch error {
                case .noInternetConnection:
                    self.presentation?.presentNoInternetConnectionErrorMessage()
                
                case .responseIsInvalid:
                    self.presentation?.presentResponseIsInvalid()
                }
            
            case .success(let characters):
                let sortedCharacters = self.sort(characters)
                self.presentation?.presentComicCharacters(characters: sortedCharacters)
            }
        }
    }
    
    func loadViewTitle() {
        self.presentation?.presentViewTitle(self.comic.title)
    }
}
