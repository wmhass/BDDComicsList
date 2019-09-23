//
//  CharactersListViewControllerSpecs.swift
//  BDDComicsListiOSTests
//
//  Created by William Hass on 2019-09-23.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import BDDComicsList

class CharactersListViewControllerSpecs: QuickSpec {
    
    var viewPresenter: CharactersListPresenterMock!
    var charactersListViewController: CharactersListViewController!
    var window: UIWindow!
    let characters = [
        ComicCharacter(id: 2, name: "Ant man"),
        ComicCharacter(id: 3, name: "Tigra"),
        ComicCharacter(id: 1, name: "3d man"),
        ComicCharacter(id: 4, name: "Hank Pym")
    ]

    override func spec() {
        describe("CharactersListViewController") {
            beforeEach {
                let viewPresenter = CharactersListPresenterMock(characters: self.characters)
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let charactersListViewController = storyBoard.instantiateViewController(withIdentifier: CharactersListViewController.DefaultStoryboardID) as? CharactersListViewController
                
                charactersListViewController?.eventHandler = viewPresenter
                charactersListViewController?.dataSource = viewPresenter

                let window = UIWindow(frame: UIScreen.main.bounds)
                window.makeKeyAndVisible()
                window.rootViewController = charactersListViewController
                
                self.window = window
                self.charactersListViewController = charactersListViewController
                self.viewPresenter = viewPresenter
                
                charactersListViewController?.view.setNeedsLayout()
                charactersListViewController?.view.layoutIfNeeded()
            }
            context("When the view finished loading") {
                it("Should have the activity indicator view initially hidden") {
                    expect(self.charactersListViewController.activityIndicator.isHidden).to(beTrue())
                    expect(self.charactersListViewController.activityIndicator.isAnimating).to(beFalse())
                }
                it("Should set an empty footer for the tableview to remove the empty lines at the end") {
                    expect(self.charactersListViewController.tableView.tableFooterView).toNot(beNil())
                    expect(self.charactersListViewController.tableView.tableFooterView).to(beAnInstanceOf(UIView.self))
                }
                it("Should have the tableView datasource set") {
                    expect(self.charactersListViewController.tableView.dataSource).to(be(self.charactersListViewController))
                }
                it("Should have table selection disabled") {
                    expect(self.charactersListViewController.tableView.allowsSelection).to(beFalse())
                }
                it("Should use automatic cell height") { expect(self.charactersListViewController.tableView.rowHeight).to(equal(UITableView.automaticDimension))
                }
            }
            
            context("When view will appear") {
                context("When the view will appear") {
                    beforeEach {
                        // Trigger view will appear
                        self.charactersListViewController.beginAppearanceTransition(true, animated: false)
                        self.charactersListViewController.endAppearanceTransition()
                    }
                    it("Should notify the event handler that the view is ready to present content") {
                        expect(self.viewPresenter._didNotifyViewIsReadyToDisplayContent).to(beTrue())
                    }
                }
            }
            
            context("When asked to displayUIActivityView with a true value") {
                beforeEach {
                    self.charactersListViewController.displayUIActivityView(true)
                }
                it("Should show the activity indicator view") {
                    expect(self.charactersListViewController.activityIndicator.isHidden).to(beFalse())
                    expect(self.charactersListViewController.activityIndicator.isAnimating).to(beTrue())
                }
            }
            
            context("When asked to displayUIActivityView with a false value") {
                beforeEach {
                    self.charactersListViewController.displayUIActivityView(false)
                }
                it("Should hide the activity indicator view") {
                    expect(self.charactersListViewController.activityIndicator.isHidden).to(beTrue())
                    expect(self.charactersListViewController.activityIndicator.isAnimating).to(beFalse())
                }
            }
            
            context("When asked to display an error alert") {
                beforeEach {
                    self.charactersListViewController.displayErrorAlert(title: "Title", message: "Message")
                }
                it("Should present it in a UIAlertController") {
                    expect(self.charactersListViewController.presentedViewController).to(beAnInstanceOf(UIAlertController.self))
                }
            }
            
            context("When asked to display the view title") {
                let mockTitle = "A title"
                beforeEach {
                    self.charactersListViewController.navigationItem.title = nil
                    self.charactersListViewController.displayViewTitle(mockTitle)
                }
                it("Should set the title as the navigationItem title") {
                    expect(self.charactersListViewController.navigationItem.title).to(equal(mockTitle))
                }
            }
            
            
            
            context("When asked to reload the list of comics") {
                beforeEach {
                    self.charactersListViewController.reloadListOfCharacters()
                    self.charactersListViewController.tableView.setNeedsLayout()
                    self.charactersListViewController.tableView.layoutIfNeeded()
                }
                it("Should display one section only") {
                    expect(self.charactersListViewController.tableView.numberOfSections).to(equal(1))
                }
                it("Should display the right number of items in the table view") {
                    expect(self.charactersListViewController.tableView.numberOfSections).to(equal(1))
                    expect(self.charactersListViewController.tableView.numberOfRows(inSection: 0)).to(equal(self.viewPresenter.numberOfCharacters))
                }

                it("Should display the correct cell with correct content") {
                    let rows = self.charactersListViewController.tableView.numberOfRows(inSection: 0)
                    for row in (0..<rows) {
                        let indexPath = IndexPath(row: row, section: 0)
                        let cell = self.charactersListViewController.tableView.cellForRow(at: indexPath)
                        expect(cell).to(beAnInstanceOf(UITableViewCell.self))
                        expect(cell?.textLabel?.text).to(equal(self.viewPresenter.nameOfCharacter(atIndex: row)))
                    }
                }
            }
        }
    }
    
}
