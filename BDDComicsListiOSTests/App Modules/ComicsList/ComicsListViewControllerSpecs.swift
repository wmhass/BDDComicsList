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
    
    var viewPresenter: ComicsListViewPresenterMock!
    var comicsListViewController: ComicsListViewController!
    var window: UIWindow!
    
    override func spec() {
        describe("ComicsListViewController") {
            beforeEach {
                let comics = [
                    Comic(id: 123, title: "aaa"),
                    Comic(id: 231, title: "baa"),
                    Comic(id: 231, title: "bba"),
                    Comic(id: 231, title: "bbb"),
                ]
                let viewPresenter = ComicsListViewPresenterMock(comics: comics)
                let comicsListViewController = AppStoryboard.Main.instance().instantiateViewController(withIdentifier: ComicsListViewController.DefaultStoryboardID) as? ComicsListViewController
                
                comicsListViewController?.evenHandler = viewPresenter
                comicsListViewController?.dataSource = viewPresenter
                
                let window = UIWindow(frame: UIScreen.main.bounds)
                window.makeKeyAndVisible()
                window.rootViewController = comicsListViewController
                
                self.window = window
                self.comicsListViewController = comicsListViewController
                self.viewPresenter = viewPresenter
                
                comicsListViewController?.view.setNeedsLayout()
                comicsListViewController?.view.layoutIfNeeded()
            }
            context("When the view finished loading") {
                it("Should have the activity indicator view initially hidden") {
                    expect(self.comicsListViewController.activityIndicator.isHidden).to(beTrue())
                    expect(self.comicsListViewController.activityIndicator.isAnimating).to(beFalse())
                }
                it("Should set an empty footer for the tableview to remove the empty lines at the end") {
                    expect(self.comicsListViewController.tableView.tableFooterView).toNot(beNil())
                    expect(self.comicsListViewController.tableView.tableFooterView).to(beAnInstanceOf(UIView.self))
                }
                it("Should have 'Marvel Comics' as its navigation title") {
                    expect(self.comicsListViewController.navigationItem.title).to(equal("Marvel Comics"))
                }
                it("Should have the tableView delegate and datasource set") {
                    expect(self.comicsListViewController.tableView.dataSource).to(be(self.comicsListViewController))
                    expect(self.comicsListViewController.tableView.delegate).to(be(self.comicsListViewController))
                }
                it("Should use automatic cell height") { expect(self.comicsListViewController.tableView.rowHeight).to(equal(UITableView.automaticDimension))
                }
            }
            
            context("When the view will appear") {
                beforeEach {
                    // Trigger view will appear
                    self.comicsListViewController.beginAppearanceTransition(true, animated: false)
                    self.comicsListViewController.endAppearanceTransition()
                }
                it("Should notify the event handler that the view is ready to present content") {
                    expect(self.viewPresenter._didNotifyViewIsReadyToDisplayContent).to(beTrue())
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
            
            context("When a cell is selected") {
                let selectedIndexPath = IndexPath(item: 1, section: 0)
                beforeEach {
                    self.viewPresenter._didNotifyAComicWasSelected = (false, nil)
                    self.comicsListViewController.tableView(self.comicsListViewController.tableView, didSelectRowAt: selectedIndexPath)
                }
                it("Should notify the event handler passing the indexPath") {
                    expect(self.viewPresenter._didNotifyAComicWasSelected.didAsk).to(beTrue())
                    expect(self.viewPresenter._didNotifyAComicWasSelected.indexPath).to(equal(selectedIndexPath))
                }
            }

            context("When asked to reload the list of comics") {
                beforeEach {
                    self.comicsListViewController.reloadListOfComics()
                    self.comicsListViewController.tableView.setNeedsLayout()
                    self.comicsListViewController.tableView.layoutIfNeeded()
                }
                it("Should display the right number of sections in the table view") {
                    expect(self.comicsListViewController.tableView.numberOfSections).to(equal(self.viewPresenter.numberOfSections))
                }
                it("Should display the right number of items in each section of the table view") {
                    expect(self.comicsListViewController.tableView.numberOfRows(inSection: 0)).to(equal(self.viewPresenter.numberOfComics(inSection: 0)))
                    expect(self.comicsListViewController.tableView.numberOfRows(inSection: 1)).to(equal(self.viewPresenter.numberOfComics(inSection: 1)))
                }
                it("Should present the correct title for each section") {
                    expect(self.comicsListViewController.tableView.headerView(forSection: 0)?.textLabel?.text).to(equal(self.viewPresenter.titleOfSection(atIndex: 0)))
                    expect(self.comicsListViewController.tableView.headerView(forSection: 1)?.textLabel?.text).to(equal(self.viewPresenter.titleOfSection(atIndex: 1)))
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
                            expect(cell?.customTitleLabel.text).to(equal(self.viewPresenter.titleOfComic(atIndex: row, inSection: section)))
                        }
                    }
                }
            }
        }
    }
    
}
