//
//  BDDComicsListUITests.swift
//  BDDComicsListUITests
//
//  Created by William Hass on 2019-09-17.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

class BDDComicsListUITests: XCTestCase {

    override func setUp() {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        let application = XCUIApplication()
        application.launchArguments = [ApplicationArguments.useMockData.rawValue]
        application.launch()
    }

    override func tearDown() {
    }

    func testCharactersListTransition() {
        XCTContext.runActivity(named: "Given that there are comics") { _ in
            XCTContext.runActivity(named: "When I select a comic", block: { _ in
                XCTContext.runActivity(named: "Then present the list of characters", block: { _ in
                    
                    let app = XCUIApplication()
                    let tablesQuery = app.tables
                    tablesQuery.cells.staticTexts["Amazing Spider-Man (1999) #558 (Turner Variant)"].tap()
                    tablesQuery.cells.staticTexts["Archangel"].tap()
                    tablesQuery.cells.staticTexts["Avalanche"].tap()
                    tablesQuery.cells.staticTexts["Blob"].tap()
                    tablesQuery.cells.staticTexts["Colossus"].tap()
                    tablesQuery.cells.staticTexts["Destiny"].tap()
                    tablesQuery.cells.staticTexts["Nightcrawler"].tap()
                    tablesQuery.cells.staticTexts["Pyro"].tap()
                    tablesQuery.cells.staticTexts["Storm"].tap()
                    tablesQuery.cells.staticTexts["Wolverine"].tap()
                    tablesQuery.cells.staticTexts["X-Men"].tap()
                    app.navigationBars["Amazing Spider-Man (1999) #558 (Turner Variant)"].buttons["Marvel Comics"].tap()
                    
                })
            })
        }
    }

}
