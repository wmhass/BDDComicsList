//
//  AppErrorMessages.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-23.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

enum AppErrorMessages {
    enum NoInternetConnectionErrorMessage: String {
        case title = "No internet connection"
        case message = "We failed fetching the comics because there are no internet connection"
    }
    enum FailedFetchingComics: String {
        case title = "Failed fetching comics"
        case message = "We failed fetching the comics because there was an error with the server response"
    }
    enum FailedFetchingComicCharacters: String {
        case title = "Failed fetching comic characters"
        case message = "We failed fetching the comic characters because there was an error with the server response"
    }
}
