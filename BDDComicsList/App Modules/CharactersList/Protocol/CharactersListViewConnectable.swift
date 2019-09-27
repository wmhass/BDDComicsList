//
//  CharactersListViewConnectable.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-27.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

protocol CharactersListViewConnectable: class {
    var eventHandler: CharactersListViewEventHandler? { get set }
    var dataSource: CharactersListViewDataSource? { get set }
}
