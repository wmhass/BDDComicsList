//
//  ComicsListViewMock.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-20.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class ComicsListViewMock {
    var _didAskToDisplayErrorAlert: (title: String?, message: String?) = (nil,nil)
    var _didAskToDisplayActivityView: (didAsk: Bool, shouldDisplay: Bool?) = (false, nil)
    var _didAskToReloadListOfComics: Bool = false
}

extension ComicsListViewMock: ComicsListDisplayLogic {
    func displayErrorAlert(title: String, message: String) {
        _didAskToDisplayErrorAlert = (title, message)
    }
    func displayUIActivityView(_ display: Bool) {
        _didAskToDisplayActivityView = (true, display)
    }
    func reloadListOfComics() {
        _didAskToReloadListOfComics = true
    }
}
