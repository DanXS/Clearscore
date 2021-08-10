//
//  ClearScoreTests.swift
//  ClearScoreTests
//
//  Created by Dan Shepherd on 10/08/2021.
//

import XCTest

@testable import ClearScore

class ClearScoreTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetCreditScore() throws {
        // Mock credit score URL
        guard let url = URL(string:"https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values") else {
            XCTFail("Invalid URL")
            return
        }
        // Expect the request to return within 5 seconds
        let expect = expectation(description: "Get mock credit score within 5 seconds")
        API.getCreditScore(url: url) { (data, error) in
            if error != nil {
                XCTFail(error.debugDescription)
            }
            XCTAssertNotNil(data, "Data should not be nil")
            debugPrint(data ?? "")
            expect.fulfill()
        }
        waitForExpectations(timeout: 5.0) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }

}
