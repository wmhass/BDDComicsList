//
//  CharactersListPresentationLogic.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
protocol CharactersListPresentationLogic: class {
    func presentResponseIsInvalid()
    func presentFetchDataActivityIndicator(_ shouldPresent: Bool)
    func presentNoInternetConnectionErrorMessage()
}
