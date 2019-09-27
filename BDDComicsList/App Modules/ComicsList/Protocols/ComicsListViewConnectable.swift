//
//  ComicsListViewConnectable.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-27.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

protocol ComicsListViewConnectable: class {
    var eventHandler: ComicsListViewEventHandler? { get set }
    var dataSource: ComicsListViewDataSource? { get set }
}
