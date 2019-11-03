//
//  CharactersListViewControllerSnapshotTests.swift
//  BDDComicsListiOSTests
//
//  Created by William Hass on 2019-09-23.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import UIKit
import XCTest
@testable import BDDComicsList

final class CharactersListViewControllerSnapshotTests: FBSnapshotTestCase {
    
    var charactersListViewController: CharactersListViewController!
    var window: UIWindow!
    let characters = [
        ComicCharacter(id: 2, name: "Ant man"),
        ComicCharacter(id: 3, name: "Tigra"),
        ComicCharacter(id: 1, name: "3d man"),
        ComicCharacter(id: 4, name: "Hank Pym")
    ]

    override func setUp() {
        super.setUp()
        self.recordMode = false
        
        let charactersListViewController = AppStoryboard.Main.instance().instantiateViewController(withIdentifier: CharactersListViewController.DefaultStoryboardID) as? CharactersListViewController
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.rootViewController = charactersListViewController
        
        self.window = window
        self.charactersListViewController = charactersListViewController
        
        charactersListViewController?.view.setNeedsLayout()
        charactersListViewController?.view.layoutIfNeeded()
    }
    
    func testCharactersListViewControllerWithCharacters() {
        self.charactersListViewController.dataSource = CharactersListPresenterMock(characters: characters)
        self.charactersListViewController.reloadListOfCharacters()
        
        self.snapshotVerifyView(self.charactersListViewController.view, withIdentifier: "")
    }
    
    func testCharactersListViewControllerWithoutCharacters() {
        self.charactersListViewController.dataSource = CharactersListPresenterMock(characters: [])
        self.charactersListViewController.reloadListOfCharacters()
        
        self.snapshotVerifyView(self.charactersListViewController.view, withIdentifier: "")
    }
    
    func testCharactersListViewControllerDisplayingError() {
        self.charactersListViewController.displayErrorAlert(title: "Error title", message: "Error message")
        self.snapshotVerifyView(self.charactersListViewController.presentedViewController?.view, withIdentifier: "")
    }
    
    func testComicsListViewControllerDisplayingActivityIndicator() {
        self.charactersListViewController.dataSource = CharactersListPresenterMock(characters: characters)
        self.charactersListViewController.reloadListOfCharacters()
        
        self.charactersListViewController.displayUIActivityView(true)
        
        self.snapshotVerifyView(self.charactersListViewController.view, withIdentifier: "")
    }
    
}
