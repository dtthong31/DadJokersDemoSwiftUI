//
//  DadJokesUITestsLaunchTests.swift
//  DadJokesUITests
//
//  Created by dtthong on 10/08/2022.
//

import XCTest

class DadJokesUITestsLaunchTests: XCTestCase {
    let app = XCUIApplication()
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        app.launchEnvironment = ["ENV":"TEST"]
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
