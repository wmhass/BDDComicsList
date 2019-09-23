//
//  CharactersListDisplayLogic.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

protocol CharactersListDisplayLogic {
    func displayErrorAlert(title: String, message: String)
    func displayUIActivityView(_ display: Bool)
    func reloadListOfCharacters()
}
