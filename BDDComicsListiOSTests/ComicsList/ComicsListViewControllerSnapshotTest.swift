//
//  ComicsListViewControllerSnapshotTest.swift
//  BDDComicsListiOSTests
//
//  Created by William Hass on 2019-09-21.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

import Foundation
import UIKit
import XCTest
@testable import BDDComicsList


class ComicsListViewControllerSnapshotTest: FBSnapshotTestCase {
    
    var comicsListViewController: ComicsListViewController!
    var window: UIWindow!

    override func setUp() {
        super.setUp()
        self.recordMode = false

        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController = storyBoard.instantiateInitialViewController() as? UINavigationController
        let comicsListViewController = initialViewController?.viewControllers.first as! ComicsListViewController
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.rootViewController = initialViewController
        
        self.window = window
        self.comicsListViewController = comicsListViewController
        
        initialViewController?.view.setNeedsLayout()
        initialViewController?.view.layoutIfNeeded()
    }
    
    func testComicsListViewControllerWithComics() {
        let comics = [
            Comic(id: 123, title: "aaa"),
            Comic(id: 231, title: "baa"),
            Comic(id: 231, title: "bba"),
            Comic(id: 231, title: "bbb"),
        ]
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
        self.comicsListViewController.displayUIActivityView(true)
        self.snapshotVerifyView(self.comicsListViewController.view, withIdentifier: "")
    }
    
}
