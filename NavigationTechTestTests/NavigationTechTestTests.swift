//
//  NavigationTechTestTests.swift
//  NavigationTechTestTests
//
//  Created by Bakkiya Lakshmi on 18/10/2020.
//  Copyright © 2020 Test. All rights reserved.
//

import XCTest
@testable import NavigationTechTest

class NavigationTechTestTests: XCTestCase {

    
    // Test for Navigation api call
    func testGetNavigationApi() {
        let e = expectation(description: "Get the results of navigation api")
        ServiceManager().fetchNavigationAPI() {
            (navResp, error) in
            XCTAssertNotNil(navResp?.nav)
            XCTAssertNil(error, "Error \(error!.localizedDescription)")
            e.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
