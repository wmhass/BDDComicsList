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
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        let application = XCUIApplication()
        application.launchArguments = ["UITests"]
        application.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testApp() {
        XCTContext.runActivity(named: "Given I launched the app") { _ in
            XCTContext.runActivity(named: "Then do [something]....", block: { _ in
                XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["Ant-Man (2003) #2"]/*[[".cells.staticTexts[\"Ant-Man (2003) #2\"]",".staticTexts[\"Ant-Man (2003) #2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeDown()
                
            })
        }
    }

}
