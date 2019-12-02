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

    func testCharactersListTransition() {
        XCTContext.runActivity(named: "Given that there are comics") { _ in
            XCTContext.runActivity(named: "When I select a comic", block: { _ in
                XCTContext.runActivity(named: "Then present the list of characters", block: { _ in
                    let app = XCUIApplication()
                    let tablesQuery = app.tables
                    let mockedComic = "Ant-Man (2003) #1"
                    
                    // Opens Spider Man details
                    let spiderMan = tablesQuery.cells.staticTexts[mockedComic]
                    XCTAssertTrue(spiderMan.exists)
                    spiderMan.tap()
                    
                    // Check list of characters
                    let charactersNames = ["Archangel", "Avalanche", "Blob", "Colossus", "Destiny", "Nightcrawler","Pyro", "Storm", "Wolverine", "X-Men"]
                    charactersNames.forEach { (characterName: String) in
                        XCTAssertTrue(tablesQuery.cells.staticTexts[characterName].exists)
                    }

                    // Navigate back to comics
                    app.navigationBars[mockedComic].buttons["Marvel Comics"].tap()
                })
            })
        }
    }
}
