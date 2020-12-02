//
//  RCTestUITests.swift
//  RCTestUITests
//
//  Created by Robin Daugherty on 2020-11-28.
//

import XCTest
import StoreKitTest

class RCTestUITests: XCTestCase {

    func testRevenueCat() throws {
        let app = XCUIApplication()
        app.launch()

        let storeKitSession = try! SKTestSession(configurationFileNamed: "Configuration")

        app.buttons["Load with RevenueCat"].tap()
        XCTAssert(app.staticTexts["$12.99"].waitForExistence(timeout: 5.0))
    }

    func testNative() throws {
        let app = XCUIApplication()
        app.launch()

        let storeKitSession = try! SKTestSession(configurationFileNamed: "Configuration")

        app.buttons["Load natively"].tap()
        XCTAssert(app.staticTexts["$12.99"].waitForExistence(timeout: 5.0))
    }

}
