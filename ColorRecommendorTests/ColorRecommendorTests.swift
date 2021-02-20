//
//  ColorRecommendorTests.swift
//  ColorRecommendorTests
//
//  Created by dphiri on 2/20/21.
//

import XCTest
@testable import ColorRecommendor

class ColorRecommendorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMainModel() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
      let model = MainModel()
      // Test 1 Colors Returned from search
      let whiteColorString = "Wh"
      let returnedColors = model.getAllColors(matching: whiteColorString)
      XCTAssert(returnedColors.contains { $0.name == "White"}, "Couldn't find White color")
      
      // Test 2 Colors Returned from search with Full Text
      let redFullString = "Red"
      let returnedColors2 = model.getAllColors(matching: redFullString)
      XCTAssert(returnedColors2.contains { $0.name == "Red"}, "Couldn't find Red color")
      
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
