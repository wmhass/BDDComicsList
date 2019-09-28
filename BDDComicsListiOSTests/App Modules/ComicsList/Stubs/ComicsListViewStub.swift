//
//  ComicsListViewStub.swift
//  BDDComicsListiOSTests
//
//  Created by William Hass on 2019-09-27.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit
@testable import BDDComicsList

class ComicsListViewStub: UIViewController, ComicsListViewConnectable {
    
    var eventHandler: ComicsListViewEventHandler?
    var dataSource: ComicsListViewDataSource?
    
    var _didAskToDisplayErrorAlert: (title: String, message: String)?
    var _didAskToReloadListOfComics: Bool = false
    var _didAskToDisplayUIActivityView: (didAsk: Bool, value: Bool)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.eventHandler?.viewIsReadyToDisplayContent()
    }
    
    var numberOfSections: Int? {
        return self.dataSource?.numberOfSections
    }
    
    func numberOfComics(inSection section: Int) -> Int? {
        return self.dataSource?.numberOfComics(inSection: section)
    }
    
    func titleOfComic(atIndex index: Int, inSection section: Int) -> String? {
        return self.dataSource?.titleOfComic(atIndex: index, inSection: section)
    }
    
    func titleOfSection(sectionIndex: Int) -> String? {
        return self.dataSource?.titleOfSection(atIndex: sectionIndex)
    }
    
    func selectComic(atIndex index: Int, inSection section: Int) {
        self.eventHandler?.comicSelected(atIndexPath: IndexPath(item: index, section: section))
    }
}

extension ComicsListViewStub: ComicsListDisplayLogic {
    func displayErrorAlert(title: String, message: String) {
        _didAskToDisplayErrorAlert = (title, message)
    }
    func displayUIActivityView(_ display: Bool) {
        _didAskToDisplayUIActivityView = (true, display)
    }
    func reloadListOfComics() {
        _didAskToReloadListOfComics = true
    }
}
