//
//  ComicsListRouterMock.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-20.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

final class ComicsListRouterMock {
    var _didAskPushCharactersListView: (didAsk: Bool, comic: Comic?) = (false, nil)
}

// MARK: - ComicsListRoutingLogic
extension ComicsListRouterMock: ComicsListRoutingLogic {
    func pushCharactersListView(ofComic comic: Comic) {
        _didAskPushCharactersListView = (true, comic)
    }
}
