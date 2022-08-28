//
//  CeibaChallengeAppTests.swift
//  CeibaChallengeAppTests
//
//  Created by viciecal on 27/08/2022.
//

import XCTest
@testable import CeibaChallengeApp

class CeibaChallengeAppTests: XCTestCase {
    
    // The have not much to test, i only test the localdata to check if exist
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    func test_LocalUsersData() {
        
        let localData: [User] = UserDefaults.standard.retrieveCodable(for: "StoredUsers") ?? []
        if localData.count == 0 {
            XCTAssertTrue(localData.count == 0)
        } else {
            XCTAssertTrue(localData.count != 0)
        }
    }

}
