//
//  ComicsListViewControllerSpecs.swift
//  BDDComicsListiOSTests
//
//  Created by William Hass on 2019-09-21.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import BDDComicsList

class ComicsListViewControllerSpecs: QuickSpec {
    
    var comicsListViewController: ComicsListViewController!
    var window: UIWindow!
    
    override func spec() {
        beforeEach {
            let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let initialViewController = storyBoard.instantiateInitialViewController()
            
            let comicsListViewController = initialViewController as? ComicsListViewController
            
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.makeKeyAndVisible()
            window.rootViewController = comicsListViewController
            
            self.window = window
            self.comicsListViewController = comicsListViewController
        }
        describe("ComicsListViewController") {
            context("When the view finished loading") {
                it("Should ask interactor to fetch the comics") {
                    
                }
            }
            context("When asked to display an error alert") {
                beforeEach {
                    self.comicsListViewController.displayErrorAlert(title: "Title", message: "Message")
                }
                it("Should present it in a UIAlertController") {
                    expect(self.comicsListViewController.presentedViewController).to(beAnInstanceOf(UIAlertController.self))
                }
            }
        }
    }
    
}
