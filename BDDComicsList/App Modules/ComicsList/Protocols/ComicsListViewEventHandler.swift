//
//  ComicsListViewEventHandler.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

protocol ComicsListViewEventHandler {
    func viewIsReadyToDisplayContent()
    func comicSelected(atIndexPath indexPath: IndexPath)
}
