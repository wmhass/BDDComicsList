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
    
    var interactorMock: ComicsListInteractorMock!
    var comicsListViewController: ComicsListViewController!
    var window: UIWindow!
    
    override func spec() {
        describe("ComicsListViewController") {
            beforeEach {
                let interactorMock = ComicsListInteractorMock()
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let initialViewController = storyBoard.instantiateInitialViewController() as? UINavigationController
                let comicsListViewController = initialViewController?.viewControllers.first as! ComicsListViewController
                
                comicsListViewController.interactor = interactorMock
                
                let window = UIWindow(frame: UIScreen.main.bounds)
                window.makeKeyAndVisible()
                window.rootViewController = initialViewController
                
                self.window = window
                self.comicsListViewController = comicsListViewController
                self.interactorMock = interactorMock
                
                initialViewController?.view.setNeedsLayout()
                initialViewController?.view.layoutIfNeeded()
            }
            context("When the view finished loading") {
                it("Should ask interactor to fetch the comics") {
                    expect(self.interactorMock._didAskToLoadListOfComics).to(beTrue())
                }
                it("Should have the activity indicator view initially hidden") {
                    expect(self.comicsListViewController.activityIndicator.isHidden).to(beTrue())
                    expect(self.comicsListViewController.activityIndicator.isAnimating).to(beFalse())
                }
            }
            
            context("When asked to displayUIActivityView with a true value") {
                beforeEach {
                    self.comicsListViewController.displayUIActivityView(true)
                }
                it("Should show the activity indicator view") {
                    expect(self.comicsListViewController.activityIndicator.isHidden).to(beFalse())
                    expect(self.comicsListViewController.activityIndicator.isAnimating).to(beTrue())
                }
            }

            context("When asked to displayUIActivityView with a false value") {
                beforeEach {
                    self.comicsListViewController.displayUIActivityView(false)
                }
                it("Should hide the activity indicator view") {
                    expect(self.comicsListViewController.activityIndicator.isHidden).to(beTrue())
                    expect(self.comicsListViewController.activityIndicator.isAnimating).to(beFalse())
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
            
            context("When asked to display a view model") {
                let comics = [
                    Comic(id: 123, title: "aaa"),
                    Comic(id: 231, title: "baa"),
                    Comic(id: 231, title: "bba"),
                    Comic(id: 231, title: "bbb"),
                ]
                let groupedSortedComics = GroupedSortedComics(comics: comics)
                let viewModel = ComicsListViewModel(groupedComics: groupedSortedComics)
                beforeEach {
                    self.comicsListViewController.displayComics(viewModel: viewModel)
                    self.comicsListViewController.tableView.setNeedsLayout()
                    self.comicsListViewController.tableView.layoutIfNeeded()
                }
                it("Should display the right number of sections in the table view") {
                    expect(self.comicsListViewController.tableView.numberOfSections).to(equal(viewModel.numberOfSections))
                }
                it("Should display the right number of items in each section of the table view") {
                    expect(self.comicsListViewController.tableView.numberOfRows(inSection: 0)).to(equal(viewModel.numberOfComics(inSection: 0)))
                    expect(self.comicsListViewController.tableView.numberOfRows(inSection: 1)).to(equal(viewModel.numberOfComics(inSection: 1)))
                }
                it("Should present the correct title for each section") {
                    expect(self.comicsListViewController.tableView.headerView(forSection: 0)?.textLabel?.text).to(equal(viewModel.titleOfSection(atIndex: 0)))
                    expect(self.comicsListViewController.tableView.headerView(forSection: 1)?.textLabel?.text).to(equal(viewModel.titleOfSection(atIndex: 1)))
                }
                
                it("Should display the correct type of cell") {
                    let numberOfSections = self.comicsListViewController.tableView.numberOfSections
                    for section in (0..<numberOfSections) {
                        let rows = self.comicsListViewController.tableView.numberOfRows(inSection: section)
                        for row in (0..<rows) {
                            let indexPath = IndexPath(row: row, section: section)
                            let cell = self.comicsListViewController.tableView.cellForRow(at: indexPath)
                            expect(cell).to(beAnInstanceOf(CustomListTableViewCell.self))
                        }
                    }
                }
                
                it("Should display the correct cell with correct content") {
                    let numberOfSections = self.comicsListViewController.tableView.numberOfSections
                    for section in (0..<numberOfSections) {
                        let rows = self.comicsListViewController.tableView.numberOfRows(inSection: section)
                        for row in (0..<rows) {
                            let indexPath = IndexPath(row: row, section: section)
                            let cell = self.comicsListViewController.tableView.cellForRow(at: indexPath) as? CustomListTableViewCell
                            expect(cell?.customTitleLabel.text).to(equal(viewModel.titleOfComic(atIndex: row, inSection: section)))
                        }
                    }
                }
            }
        }
    }
    
}
