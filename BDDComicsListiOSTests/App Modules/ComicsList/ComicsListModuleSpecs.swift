//
//  ComicsListModuleSpecs.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-27.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import BDDComicsList

class ComicsListModuleSpecs: QuickSpec {

    let dataGatewayMock = ComicsListDataGatewayMock()
    let viewStub = ComicsListViewStub()
    let routerStub = ComicsListRouterStub()

    override func spec() {
        beforeSuite {
            let dependencyContainer = ComicsListModuleDependenciesContainer(dataGateway: self.dataGatewayMock,
                                                                            router: self.routerStub)
            ComicsListModuleDependencies().injectDependencies(comicsListViewController: self.viewStub, dependencyContainer: dependencyContainer)
        }
        describe("Given that I don't have internet connection") {
            beforeEach {
                self.dataGatewayMock._fetchComicsResponseMock = .failure(.noInternetConnection)
            }
            context("When it tries to load comics") {
                beforeEach {
                    self.viewStub._didAskToDisplayErrorAlert = nil
                    self.viewStub._forceViewLoad()
                }
                it("Then present a message informing that there is no internet connection") {
                    expect(self.viewStub._didAskToDisplayErrorAlert).toNot(beNil())
                }
            }
        }
        
        describe("Given that I have internet connection") {
            context("When the server response is invalid") {
                beforeEach {
                    self.dataGatewayMock._fetchComicsResponseMock = .failure(.responseIsInvalid)
                    self.viewStub._didAskToDisplayErrorAlert = nil
                    self.viewStub._forceViewLoad()
                }
                it("Then present an error message informing that the content couldn't be read") {
                    expect(self.viewStub._didAskToDisplayErrorAlert).toNot(beNil())
                }
            }
        }
        
        describe("Given that I have internet connection") {
            context("When the server response is valid") {
                beforeEach {
                    let comics = [
                        Comic(id: 123, title: "aaa"),
                        Comic(id: 231, title: "baa"),
                        Comic(id: 231, title: "bba"),
                        Comic(id: 231, title: "bbb"),
                    ]
                    self.dataGatewayMock._fetchComicsResponseMock = .success(comics)
                    self.viewStub._didAskToReloadListOfComics = false
                    self.viewStub._forceViewLoad()
                }
                it("Then present a list of Marvel Comics titles grouped and sorted ascending by the first letter of the comic's title") {
                    expect(self.viewStub._didAskToReloadListOfComics).to(beTrue())
                    expect(self.viewStub.numberOfSections).to(equal(2))
                    expect(self.viewStub.titleOfSection(sectionIndex: 0)).to(equal("A"))
                    expect(self.viewStub.numberOfComics(inSection: 0)).to(equal(1))
                    expect(self.viewStub.titleOfComic(atIndex: 0, inSection: 0)).to(equal("aaa"))
                    
                    expect(self.viewStub.titleOfSection(sectionIndex: 1)).to(equal("B"))
                    expect(self.viewStub.numberOfComics(inSection: 1)).to(equal(3))
                    expect(self.viewStub.titleOfComic(atIndex: 0, inSection: 1)).to(equal("baa"))
                    expect(self.viewStub.titleOfComic(atIndex: 1, inSection: 1)).to(equal("bba"))
                    expect(self.viewStub.titleOfComic(atIndex: 2, inSection: 1)).to(equal("bbb"))
                }
            }
        }
        
        describe("Given that I opened the app") {
            context("When it is loading comics") {
                beforeEach {
                    self.dataGatewayMock._fetchComicsResponseMock = nil
                    self.viewStub._didAskToDisplayUIActivityView = nil
                    self.viewStub._forceViewLoad()
                }
                it("Then present a UI activity indicator") {
                    expect(self.viewStub._didAskToDisplayUIActivityView?.didAsk).to(beTrue())
                    expect(self.viewStub._didAskToDisplayUIActivityView?.value).to(beTrue())
                }
            }
        }
        
        describe("Given that I opened the app") {
            context("When it finished loading comics") {
                beforeEach {
                    self.dataGatewayMock._fetchComicsResponseMock = .success([])
                    self.viewStub._didAskToDisplayUIActivityView = nil
                    self.viewStub._forceViewLoad()
                }
                it("Then hide the UI activity indicator") {
                    expect(self.viewStub._didAskToDisplayUIActivityView?.didAsk).to(beTrue())
                    expect(self.viewStub._didAskToDisplayUIActivityView?.value).to(beFalse())
                }
            }
        }
        
        describe("Given that I have internet connection And the list of comics has one or more items") {
            let comics = [
                Comic(id: 123, title: "aaa")
            ]
            beforeEach {
                self.dataGatewayMock._fetchComicsResponseMock = .success(comics)
                self.viewStub._forceViewLoad()
            }
            context("When I tapped on a comic title") {
                beforeEach {
                    self.routerStub._didAskToPushCharactersListView = (false, nil)
                    self.viewStub.selectComic(atIndex: 0, inSection: 0)
                }
                it("Then present the characters list") {
                    expect(self.routerStub._didAskToPushCharactersListView.didAsk).to(beTrue())
                    expect(self.routerStub._didAskToPushCharactersListView.comic).to(equal(comics[0]))
                }
            }
        }
        
    }
    
}
