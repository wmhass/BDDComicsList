//
//  ComicsListPresenterMock.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class ComicsListPresenterMock {
    var _didAskToPresentNoInternetConnectionErrorMessage: Bool = false
}

extension ComicsListPresenterMock: ComicsListPresentationLogic {
    func presentNoInternetConnectionErrorMessage() {
        _didAskToPresentNoInternetConnectionErrorMessage = true
    }
}
