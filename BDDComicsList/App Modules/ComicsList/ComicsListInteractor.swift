//
//  ComicsListInteractor.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-18.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class ComicsListInteractor {

    weak var presentation: ComicsListPresentationLogic?
    let dataGateway: ComicsListDataGatewayLogic
    
    init(dataGateway: ComicsListDataGatewayLogic) {
        self.dataGateway = dataGateway
    }
}

extension ComicsListInteractor: ComicsListBusinessLogic {
    func loadListOfComics() {
        self.presentation?.presentFetchDataActivityIndicator(true)
        self.dataGateway.fetchComics { fetchComicsResponse in
            self.presentation?.presentFetchDataActivityIndicator(false)
            switch fetchComicsResponse {
            case .noInternetConnection:
                self.presentation?.presentNoInternetConnectionErrorMessage()
            case .responseIsInvalid:
                self.presentation?.presentResponseIsInvalid()
            case .success(let comics):
                self.presentation?.presentComics(groupedComics: GroupedSortedComics(comics: comics))
            }
        }
    }
    func comicSelected(comic: Comic) {
        self.presentation?.presentCharacters(ofComic: comic)
    }
}
