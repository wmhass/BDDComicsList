//
//  ComicsListPresenterSpecs.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import Quick
import Nimble

//func presentResponseIsInvalid()
//func presentNoInternetConnectionErrorMessage()
//func presentFetchDataActivityIndicator(_ shouldPresent: Bool)
//func presentComics(groupedComics: GroupedComics)
//func presentCharacters(ofComic comic: Comic)

class ComicsListPresenterSpecs: QuickSpec {
    
    var presenter: ComicsListPresenter!
    var viewMock: ComicsListViewMock!
    var routerMock: ComicsListRouterMock!
    var interactorMock: ComicsListInteractorMock!
    
    override func spec() {
        beforeSuite {
            let interactorMock = ComicsListInteractorMock()
            let routerMock = ComicsListRouterMock()
            let viewMock = ComicsListViewMock()
            let presenter = ComicsListPresenter(router: routerMock, interactor: interactorMock)
            presenter.view = viewMock

            self.interactorMock = interactorMock
            self.routerMock = routerMock
            self.viewMock = viewMock
            self.presenter = presenter
        }
        
        describe("ComicsListViewDataSource") {
            context("When there are comics to present") {
                let comics = [
                    Comic(id: 123, title: "Comic 1"),
                    Comic(id: 234, title: "Comic 2"),
                    Comic(id: 345, title: "Comic 3"),
                    Comic(id: 345, title: "Avengers"),
                    Comic(id: 345, title: "Aaskdjasd"),
                    Comic(id: 345, title: "Bahsdkh")
                ]
                let groupedComics = GroupedSortedComics(comics: comics)
                beforeEach {
                    self.presenter.presentComics(groupedComics: groupedComics)
                }
                it("Should return the correct number of sections") {
                    expect(self.presenter.numberOfSections).to(equal(groupedComics.sortedKeys.count))
                }
                it("Should return the correct number of comics in each section") {
                    for section in (0..<groupedComics.sortedKeys.count) {
                        let key = groupedComics.sortedKeys[section]
                        let comicsInSection = groupedComics.groupedComics[key]
                        expect(self.presenter.numberOfComics(inSection: section)).to(equal(comicsInSection?.count))
                    }
                }
                it("Should return the correct title for each section") {
                    for section in (0..<groupedComics.sortedKeys.count) {
                        let key = groupedComics.sortedKeys[section]
                        expect(self.presenter.titleOfSection(atIndex: section)).to(equal(key.uppercased()))
                    }
                }
                it("Should return the correct title for each comic") {
                    for section in (0..<groupedComics.sortedKeys.count) {
                        let key = groupedComics.sortedKeys[section]
                        let comicsInSection = groupedComics.groupedComics[key]!
                        let numOfComics = comicsInSection.count
                        for comicIndex in (0..<numOfComics) {
                            expect(self.presenter.titleOfComic(atIndex: comicIndex, inSection: section)).to(equal(comicsInSection[comicIndex].title))
                        }
                    }
                }
            }
        }
        
        describe("ComicsListViewEventHandler") {
            context("When view is ready to display content") {
                beforeEach {
                    self.interactorMock._didAskToLoadListOfComics = false
                    self.presenter.viewIsReadyToDisplayContent()
                }
                it("Should ask interactor to load the list of comics") {
                    expect(self.interactorMock._didAskToLoadListOfComics).to(beTrue())
                }
            }
            context("When a valid cell is selected at an index path") {
                let comics = [
                    Comic(id: 123, title: "Comic 1")
                ]
                let groupedComics = GroupedSortedComics(comics: comics)
                beforeEach {
                    self.interactorMock._didNotifyAComicWasSelected = (false, nil)
                    self.presenter.presentComics(groupedComics: groupedComics)
                    self.presenter.comicSelected(atIndexPath: IndexPath(item: 0, section: 0))
                }
                it("Should notify the interactor that a comic was selected passing the comic as a parameter") {
                    expect(self.interactorMock._didNotifyAComicWasSelected.didAsk).to(beTrue())
                    expect(self.interactorMock._didNotifyAComicWasSelected.comic).to(equal(comics[0]))
                }
            }
            
            context("When an invalid cell is selected at an index path") {
                let comics = [
                    Comic(id: 123, title: "Comic 1")
                ]
                let groupedComics = GroupedSortedComics(comics: comics)
                beforeEach {
                    self.interactorMock._didNotifyAComicWasSelected = (false, nil)
                    self.presenter.presentComics(groupedComics: groupedComics)
                    self.presenter.comicSelected(atIndexPath: IndexPath(item: 1, section: 0))
                }
                it("Should not notify the interactor") {
                    expect(self.interactorMock._didNotifyAComicWasSelected.didAsk).to(beFalse())
                    expect(self.interactorMock._didNotifyAComicWasSelected.comic).to(beNil())
                }
            }
        }
        
        describe("ComicsListPresentationLogic") {
            context("When it is asked to presentResponseIsInvalid") {
                beforeEach {
                    self.viewMock._didAskToDisplayErrorAlert = (nil, nil)
                    self.presenter.presentResponseIsInvalid()
                }
                it("Should ask view to display an alert informing that there was an error with the server response") {
                    expect(self.viewMock._didAskToDisplayErrorAlert.title).to(equal(AppErrorMessages.FailedFetchingComics.title.rawValue))
                    expect(self.viewMock._didAskToDisplayErrorAlert.message).to(equal(AppErrorMessages.FailedFetchingComics.message.rawValue))
                }
            }
            
            context("When it is asked to presentNoInternetConnectionErrorMessage") {
                beforeEach {
                    self.viewMock._didAskToDisplayErrorAlert = (nil, nil)
                    self.presenter.presentNoInternetConnectionErrorMessage()
                }
                it("Should ask view to display an alert informing that there is no internet connection") {
                    expect(self.viewMock._didAskToDisplayErrorAlert.title).to(equal(AppErrorMessages.NoInternetConnectionErrorMessage.title.rawValue))
                    expect(self.viewMock._didAskToDisplayErrorAlert.message).to(equal(AppErrorMessages.NoInternetConnectionErrorMessage.message.rawValue))
                }
            }
            
            context("When it is asked to presentFetchDataActivityIndicator with true value") {
                beforeEach {
                    self.viewMock._didAskToDisplayActivityView = (false, nil)
                    self.presenter.presentFetchDataActivityIndicator(true)
                }
                it("Should ask view to display a UI activity indicator") {
                    expect(self.viewMock._didAskToDisplayActivityView.didAsk).to(beTrue())
                    expect(self.viewMock._didAskToDisplayActivityView.shouldDisplay).to(beTrue())
                }
            }
            
            context("When it is asked to presentFetchDataActivityIndicator with false value") {
                beforeEach {
                    self.viewMock._didAskToDisplayActivityView = (false, nil)
                    self.presenter.presentFetchDataActivityIndicator(false)
                }
                it("Should ask view to hide a UI activity indicator") {
                    expect(self.viewMock._didAskToDisplayActivityView.didAsk).to(beTrue())
                    expect(self.viewMock._didAskToDisplayActivityView.shouldDisplay).to(beFalse())
                }
            }
            
            context("When it is asked to presentCharacters") {
                let comic = Comic(id: 123, title: "Comic 1")
                beforeEach {
                    self.routerMock._didAskPushCharactersListView = (false, nil)
                    self.presenter.presentCharacters(ofComic: comic)
                }
                it("Should ask the router to present the characters list view") {
                    expect(self.routerMock._didAskPushCharactersListView.didAsk).to(beTrue())
                    expect(self.routerMock._didAskPushCharactersListView.comic).to(equal(comic))
                }
            }
            
            context("When it is asked to presentComics(groupedComics: GroupedComics)") {
                let comics = [
                    Comic(id: 123, title: "Comic 1"),
                    Comic(id: 234, title: "Comic 2"),
                    Comic(id: 345, title: "Comic 3")
                ]
                let groupedComics = GroupedSortedComics(comics: comics)
                beforeEach {
                    self.viewMock._didAskToReloadListOfComics = false
                    self.presenter.presentComics(groupedComics: groupedComics)
                }

                it("Should ask the view to reload the table data") {
                    expect(self.viewMock._didAskToReloadListOfComics).to(beTrue())
                }
            }
            
        }
    }
}
