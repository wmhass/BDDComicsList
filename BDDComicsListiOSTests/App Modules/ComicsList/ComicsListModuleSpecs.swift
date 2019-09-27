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
    
    override func spec() {
        
        describe("Given that I don't have internet connection") {
            
            beforeEach {
                let comicsListViewController = AppStoryboard.Main.instance().instantiateViewController(withIdentifier: ComicsListViewController.DefaultStoryboardID) as! ComicsListViewController
                
                // Data Layer
                let remoteData = MockedComicsListData()
                
                let dataGateway = ComicsListDataGateway(remoteData: remoteData)
                
                // Business Logic
                let interactor = ComicsListInteractor(dataGateway: dataGateway)
                
                // Presentation layer
                let router = ComicsListRouter()
                let presenter = ComicsListPresenter(router: router, interactor: interactor)
                
                
                // Dependency Injection
                router.viewController = comicsListViewController
                comicsListViewController.eventHandler = presenter
                comicsListViewController.dataSource = presenter
                presenter.view = comicsListViewController
                interactor.presentation = presenter
                
            }
            
            context("When it tries to load comics") {
                it("Then present a message informing that there is no internet connection") {
                    
                }
            }
        }
        
        describe("Given that I have internet connection") {
            context("When the server response is invalid") {
                it("Then present an error message informing that the content couldn't be read") {
                    
                }
            }
        }
        
        describe("Given that I have internet connection") {
            context("When the server response is valid") {
                it("Then present a list of Marvel Comics titles grouped and sorted ascending by the first letter of the comic's title") {
                    
                }
            }
        }
        
        describe("Given that I opened the app") {
            context("When it is loading comics") {
                it("Then present a UI activity indicator") {
                    
                }
            }
        }
        
        describe("Given that I opened the app") {
            context("When it finished loading comics") {
                it("Then hide the UI activity indicator") {
                    
                }
            }
        }
        
    }
    
}
