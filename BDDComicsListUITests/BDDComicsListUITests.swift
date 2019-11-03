//
//  BDDComicsListUITests.swift
//  BDDComicsListUITests
//
//  Created by William Hass on 2019-09-17.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

final class BDDComicsListUITests: XCTestCase {

    override func setUp() {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        self.continueAfterFailure = false

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
                    
                    let spiderMan = tablesQuery.cells.staticTexts["Amazing Spider-Man (1999) #558 (Turner Variant)"]
                    XCTAssertTrue(spiderMan.exists)
                    spiderMan.tap()
                    XCTAssertTrue(tablesQuery.cells.staticTexts["Archangel"].exists)
                    XCTAssertTrue(tablesQuery.cells.staticTexts["Avalanche"].exists)
                    XCTAssertTrue(tablesQuery.cells.staticTexts["Blob"].exists)
                    XCTAssertTrue(tablesQuery.cells.staticTexts["Colossus"].exists)
                    XCTAssertTrue(tablesQuery.cells.staticTexts["Destiny"].exists)
                    XCTAssertTrue(tablesQuery.cells.staticTexts["Nightcrawler"].exists)
                    XCTAssertTrue(tablesQuery.cells.staticTexts["Pyro"].exists)
                    XCTAssertTrue(tablesQuery.cells.staticTexts["Storm"].exists)
                    XCTAssertTrue(tablesQuery.cells.staticTexts["Wolverine"].exists)
                    XCTAssertTrue(tablesQuery.cells.staticTexts["X-Men"].exists)

                    app.navigationBars["Amazing Spider-Man (1999) #558 (Turner Variant)"].buttons["Marvel Comics"].tap()                    
                })
            })
        }
    }
}
