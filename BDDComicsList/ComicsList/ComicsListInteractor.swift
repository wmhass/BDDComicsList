//
//  ComicsListInteractor.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-18.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class ComicsListInteractor {

    weak var presenter: ComicsListPresentationLogic?
    let dataGateway: ComicsListDataGatewayLogic
    
    init(dataGateway: ComicsListDataGatewayLogic) {
        self.dataGateway = dataGateway
    }
}

extension ComicsListInteractor: ComicsListBusinessLogic {
    func loadListOfComics() {
        self.presenter?.presentFetchDataActivityIndicator(true)
        self.dataGateway.fetchComics { fetchComicsResponse in
            self.presenter?.presentFetchDataActivityIndicator(false)
            switch fetchComicsResponse {
            case .noInternetConnection:
                self.presenter?.presentNoInternetConnectionErrorMessage()
            case .responseIsInvalid:
                self.presenter?.presentResponseIsInvalid()
            case .success(let comics):
                self.presenter?.presentComics(groupedComics: GroupedSortedComics(comics: comics))
            }
        }
    }
    func comicSelected(comic: Comic) {
        self.presenter?.presentCharacters(ofComic: comic)
    }
}
