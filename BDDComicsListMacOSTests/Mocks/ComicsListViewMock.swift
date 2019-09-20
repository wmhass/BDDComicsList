//
//  ComicsListViewMock.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-20.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class ComicsListViewMock {
    var _didAskTodisplayErrorAlert: (title: String?, message: String?) = (nil,nil)
}

extension ComicsListViewMock: ComicsListDisplayLogic {
    func displayErrorAlert(title: String, message: String) {
        _didAskTodisplayErrorAlert = (title, message)
    }
}
