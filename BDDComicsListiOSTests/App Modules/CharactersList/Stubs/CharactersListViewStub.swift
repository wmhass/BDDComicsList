//
//  CharactersListViewStub.swift
//  BDDComicsListiOSTests
//
//  Created by William Hass on 2019-09-27.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit
@testable import BDDComicsList

final class CharactersListViewStub: UIViewController, CharactersListViewConnectable {
    var eventHandler: CharactersListViewEventHandler?
    var dataSource: CharactersListViewDataSource?

    var _didAskToDisplayErrorAlert: (title: String, message: String)?
    var _didAskToDisplayUIActivityView: (didAsk: Bool, value: Bool)? = nil
    var _didAskToReloadListOfCharacters: Bool = false
    var _didAskToDisplayViewTitle: (didAsk: Bool, title: String?) = (false, nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.eventHandler?.viewIsReadyToDisplayContent()
    }
    
    var numberOfCharacters: Int? {
        return self.dataSource?.numberOfCharacters
    }
    
    func characterName(atIndex index: Int) -> String? {
        return self.dataSource?.nameOfCharacter(atIndex: index)
    }
    
}

// MARK: - CharactersListDisplayLogic
extension CharactersListViewStub: CharactersListDisplayLogic {
    func displayErrorAlert(title: String, message: String) {
        _didAskToDisplayErrorAlert = (title, message)
    }
    func displayUIActivityView(_ display: Bool) {
        _didAskToDisplayUIActivityView = (true, display)
    }
    func reloadListOfCharacters() {
        _didAskToReloadListOfCharacters = true
    }
    func displayViewTitle(_ viewTitle: String) {
        _didAskToDisplayViewTitle = (true, viewTitle)
    }
}
