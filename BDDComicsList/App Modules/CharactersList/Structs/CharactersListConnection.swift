//
//  CharactersListConnection.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

// TODO: Remove this when we create the CharactesListViewController
typealias CharactesListViewController = UIViewController

struct CharactersListConnection {
    var connectDependencies: (ComicsListViewController?, CharactesListViewController?) -> Void
}
