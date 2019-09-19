//
//  ComicsListInteractor.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-18.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

struct ComicsGrouper {
    
    static func groupedComics(fromComics comics: [Comic]) -> GroupedComics {
        return comics.reduce(into: [ComicTitleFirstLetter: [Comic]](), { (result, comic) in
            guard let firstLetter = comic.title.first?.lowercased() else {
                return
            }
            if var comicsGroup = result[firstLetter]  {
                comicsGroup.append(comic)
                result[firstLetter] = comicsGroup
            } else {
                result[firstLetter] = [comic]
            }
        })
    }
    
}

class ComicsListInteractor {

    let presenter: ComicsListPresentationLogic
    let dataGateway: ComicsListDataGatewayLogic
    
    init(presenter: ComicsListPresentationLogic, dataGateway: ComicsListDataGatewayLogic) {
        self.presenter = presenter
        self.dataGateway = dataGateway
    }
}

extension ComicsListInteractor: ComicsListBusinessLogic {
    func loadListOfComics() {
        self.presenter.presentFetchDataActivityIndicator(true)
        self.dataGateway.fetchComics { fetchComicsResponse in
            self.presenter.presentFetchDataActivityIndicator(false)
            switch fetchComicsResponse {
            case .noInternetConnection:
                self.presenter.presentNoInternetConnectionErrorMessage()
            case .responseIsInvalid:
                self.presenter.presentResponseIsInvalid()
            case .success(let comics):
                break;
//                self.presenter.presentComics(comics: comics)
            }
        }
    }
}
