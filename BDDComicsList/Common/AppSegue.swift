//
//  AppSegue.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

enum AppSegue: String {
    case characterList = "CharacterListSegue"
    
    // TODO:: Can we use Generics here?
    func prepare(segue: UIStoryboardSegue, sender: Any?) {
        switch self {
        case .characterList:
            if let connection = sender as? CharactersListConnection {
                connection.connectDependencies(segue.source as? ComicsListViewController, segue.destination as? CharactesListViewController)
            }
        }
    }
}
