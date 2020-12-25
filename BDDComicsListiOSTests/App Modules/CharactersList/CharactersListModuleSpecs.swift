//
//  CharactersListModuleSpecs.swift
//  BDDComicsListiOSTests
//
//  Created by William Hass on 2019-09-27.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit
import Nimble
import Quick
@testable import BDDComicsList

final class CharactersListModuleSpecs: QuickSpec {
    
    let viewStub = CharactersListViewStub()
    let dataGatewayMock = CharactersListDataGatewayMock()
    let comic = Comic(id: 1, title: "acomic")
    
    override func spec() {

        beforeSuite {
            let dependencyContainer = CharactersListModuleDependenciesContainer(dataGateway: self.dataGatewayMock,
                                                                                comic: self.comic)
            CharactersListModuleDependencies().injectDependencies(charactersListViewController: self.viewStub, dependencyContainer: dependencyContainer)
        }
        
        describe("Given that I have internet connection") {
            beforeEach {
                self.dataGatewayMock._fetchComicCharactersResponseMock = .failure(.responseIsInvalid)
            }
            context("When the server response is invalid") {
                beforeEach {
                    self.viewStub._didAskToDisplayErrorAlert = nil
                    self.viewStub._forceViewLoad()
                }
                it("Then present an error message informing that the content couldn't be read") {
                    expect(self.viewStub._didAskToDisplayErrorAlert).toNot(beNil())
                }
            }
        }
        
        describe("Given that I don't have internet connection") {
            beforeEach {
                self.dataGatewayMock._fetchComicCharactersResponseMock = .failure(.noInternetConnection)
            }
            context("When it tries to load the comic characters") {
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
            context("When the server response is valid") {
                let comicCharacters = [
                    ComicCharacter(id: 2, name: "Ant man"),
                    ComicCharacter(id: 3, name: "Tigra"),
                    ComicCharacter(id: 1, name: "3d man"),
                    ComicCharacter(id: 4, name: "Hank Pym")
                ].sorted(by: { $0.name < $1.name })
                beforeEach {
                    self.viewStub._didAskToReloadListOfCharacters = false
                    self.dataGatewayMock._fetchComicCharactersResponseMock = .success(comicCharacters)
                    self.viewStub._forceViewLoad()
                }
                it("Then present a list with the name of the characters of that comic sorted ascending by the first letter") {
                    expect(self.viewStub._didAskToReloadListOfCharacters).to(beTrue())
                    expect(self.viewStub.numberOfCharacters).to(equal(comicCharacters.count))
                    expect(self.viewStub.characterName(atIndex: 0)).to(equal(comicCharacters[0].name))
                    expect(self.viewStub.characterName(atIndex: 1)).to(equal(comicCharacters[1].name))
                    expect(self.viewStub.characterName(atIndex: 2)).to(equal(comicCharacters[2].name))
                    expect(self.viewStub.characterName(atIndex: 3)).to(equal(comicCharacters[3].name))
                }
            }
        }
        
        describe("Given that a comic was selected") {
            context("When the view with the list of comic characters is presented") {
                beforeEach {
                    self.viewStub._didAskToDisplayViewTitle = (false, nil)
                    self.viewStub._forceViewLoad()
                }
                it("Then show the name of the comic as the view's title") {
                    expect(self.viewStub._didAskToDisplayViewTitle.didAsk).to(beTrue())
                    expect(self.viewStub._didAskToDisplayViewTitle.title).to(equal(self.comic.title))
                }
            }
        }
        
        describe("Given that a comic was selected") {
            context("When the app is loading the comic characters") {
                beforeEach {
                    self.dataGatewayMock._fetchComicCharactersResponseMock = nil
                    self.viewStub._didAskToDisplayUIActivityView = nil
                    self.viewStub._forceViewLoad()
                }
                it("Then present a UI activity indicator") {
                    expect(self.viewStub._didAskToDisplayUIActivityView?.didAsk).to(beTrue())
                    expect(self.viewStub._didAskToDisplayUIActivityView?.value).to(beTrue())
                }
            }
        }
        
        describe("Given that a comic was selected") {
            context("When the app finished loading the comic characters") {
                beforeEach {
                    self.dataGatewayMock._fetchComicCharactersResponseMock = .success([])
                    self.viewStub._didAskToDisplayUIActivityView = nil
                    self.viewStub._forceViewLoad()
                }
                it("Then hide the UI activity indicator") {
                    expect(self.viewStub._didAskToDisplayUIActivityView?.didAsk).to(beTrue())
                    expect(self.viewStub._didAskToDisplayUIActivityView?.value).to(beFalse())
                }
            }
        }
        
    }
    
}

