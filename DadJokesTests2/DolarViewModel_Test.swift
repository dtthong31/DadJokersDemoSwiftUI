//
//  DolarViewModel_Test.swift
//  DadJokesTests2
//
//  Created by dtthong on 16/08/2022.
//
import XCTest


// naming structure: test_[struct or class]_[variable or function]_[expected result]
// testing Structure: Given, When, Then
class DolarViewModel_Test: XCTestCase {
    private var converters: Converters!
    
    override func setUpWithError() throws {
        converters = Converters()
    }

    override func tearDownWithError() throws {
       converters = nil
    }
    
    func test_Converters_convert500Vnd_shouldReturn2148$(){
//      Given
        let vnd = "500000"
        let expected = "$21.48"
//      When
        let actual = converters.convertVNtoUSD(vnd: vnd)
//      Then
        XCTAssertNotNil(vnd)
        XCTAssertEqual(actual, expected)
    }
    func test_Converters_convertNilVnd_ErrorMessage(){
//      Given
        let vnd = ""
        let expected = "Please enter number."
//      When
        let actual = converters.convertVNtoUSD(vnd: vnd)
//      Then
        XCTAssertEqual(actual, expected)
    }
    
    func test_Converters_convertEg500Vnd_ErrorMessage(){
//      Given
        let vnd = "-500"
        let expected = "Please enter a positive number."
//      When
        let actual = converters.convertVNtoUSD(vnd: vnd)
//      Then
        XCTAssertEqual(actual, expected)
    }
    func test_Converters_convertBigVnd_ErrorMessage(){
//      Given
//        vnd > 1000000000000
        let vnd = "5000000000000"
        let expected = "Value too big to convert."
//      When
        let actual = converters.convertVNtoUSD(vnd: vnd)
//      Then
        XCTAssertEqual(actual, expected)
    }
    
    func test_Converters_saveMoneyConverters_shouldThrowError_noData(){
//      Given
        let vnd = ""
//      When

//      Then
        XCTAssertThrowsError(try converters.saveMoneyConverters(item: vnd))
    }
    
    func test_arrayAddItem(){
        var shoppingList: [String] = ["Eggs", "Milk", "Flour", "Baking Powder", "Chocolate Spread", "Cheese", "Butter"];
//        shoppingList[4...6] = ["banana", "Coconut"]
        
        for index in shoppingList.enumerated() {
            print(index)
        }
    }
  
}
