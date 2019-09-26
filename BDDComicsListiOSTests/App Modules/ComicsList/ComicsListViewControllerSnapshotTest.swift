//
//  ComicsListViewControllerSnapshotTest.swift
//  BDDComicsListiOSTests
//
//  Created by William Hass on 2019-09-21.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import UIKit
import XCTest
@testable import BDDComicsList

class ComicsListViewControllerSnapshotTest: FBSnapshotTestCase {
    
    var comicsListViewController: ComicsListViewController!
    var window: UIWindow!
    let comics = [
        Comic(id: 123, title: "aaa"),
        Comic(id: 231, title: "baa"),
        Comic(id: 231, title: "bba"),
        Comic(id: 231, title: "bbb"),
    ]

    override func setUp() {
        super.setUp()
        self.recordMode = false

        let comicsListViewController = AppStoryboard.Main.instance().instantiateViewController(withIdentifier: ComicsListViewController.DefaultStoryboardID) as? ComicsListViewController
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.rootViewController = comicsListViewController
        
        self.window = window
        self.comicsListViewController = comicsListViewController
        
        comicsListViewController?.view.setNeedsLayout()
        comicsListViewController?.view.layoutIfNeeded()
    }
    
    func testComicsListViewControllerWithComics() {
        self.comicsListViewController.dataSource = ComicsListViewPresenterMock(comics: comics)
        
        self.comicsListViewController.reloadListOfComics()
        
        self.snapshotVerifyView(self.comicsListViewController.view, withIdentifier: "")
    }
    
    func testComicsListViewControllerWithoutComics() {
        self.comicsListViewController.dataSource = ComicsListViewPresenterMock(comics: [])
        self.comicsListViewController.reloadListOfComics()
        
        self.snapshotVerifyView(self.comicsListViewController.view, withIdentifier: "")
    }
    
    func testComicsListViewControllerDisplayingError() {
        self.comicsListViewController.displayErrorAlert(title: "Error title", message: "Error message")
        self.snapshotVerifyView(self.comicsListViewController.presentedViewController?.view, withIdentifier: "")
    }
    
    func testComicsListViewControllerDisplayingActivityIndicator() {
        self.comicsListViewController.dataSource = ComicsListViewPresenterMock(comics: comics)
        
        self.comicsListViewController.reloadListOfComics()

        self.comicsListViewController.displayUIActivityView(true)
        self.snapshotVerifyView(self.comicsListViewController.view, withIdentifier: "")
    }
    
}
