//
//  ComicsListRouterStub.swift
//  BDDComicsListiOSTests
//
//  Created by William Hass on 2019-09-27.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
@testable import BDDComicsList

final class ComicsListRouterStub {
    var _didAskToPushCharactersListView: (didAsk: Bool, comic: Comic?) = (false, nil)
}

// MARK: - ComicsListRoutingLogic
extension ComicsListRouterStub: ComicsListRoutingLogic {
    func pushCharactersListView(ofComic comic: Comic) {
        _didAskToPushCharactersListView = (true, comic)
    }
}
