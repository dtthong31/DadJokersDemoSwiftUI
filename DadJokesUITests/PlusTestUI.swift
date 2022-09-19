//
//  PlusTestUI.swift
//  DadJokesUITests
//
//  Created by dtthong on 10/08/2022.
//

import XCTest

class PlusTestUI: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
       
    }

    override func tearDownWithError() throws {
        
    }
    
    func test_PlusViewUI_btnSubmit_notConvertedMoney() {
//        Given
//        Then
//        Then
        
        let bartonButton = app.tables/*@START_MENU_TOKEN@*/.buttons["Barton"]/*[[".cells[\"Barton\"].buttons[\"Barton\"]",".buttons[\"Barton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        bartonButton.tap()
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Animal"].tap()
        
    }
    func signInText(shouldKeyoard: Bool){
        let tabBar = app.tabBars["Tab Bar"]
        let tabPlus = tabBar.buttons["Plus"]
        let textField = app.textFields["SignUpDolar"]
        
        tabPlus.tap()
        textField.tap()
        
        if shouldKeyoard {
            let key = app.keys["1"]
            key.tap()
            
            let key2 = app.keys["2"]
            key2.tap()
            
            let key3 = app.keys["0"]
            key3.tap()
            key3.tap()
            key3.tap()
            key3.tap()
            key3.tap()
        }
        let btnSubmit = app.buttons["Submit"]
        btnSubmit.tap()
//        let existSubmit = btnSubmit.waitForExistence(timeout: 10)
//        XCTAssertTrue(existSubmit)
    }
    func test_PlusViewUI_btnSubmit_convertedMoney() {
        
//        Given
        signInText(shouldKeyoard: true)
        
//        When
        let viewResult = app.textViews["ViewResult"]
        
//        Then
        app.tables.cells["$51.54, Submit"].children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()
        XCTAssertTrue(viewResult.exists)
    }
    
   
}
