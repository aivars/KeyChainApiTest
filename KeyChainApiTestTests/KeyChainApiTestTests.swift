//
//  KeyChainApiTestTests.swift
//  KeyChainApiTestTests
//
//  Created by Aivars Meijers on 25/09/2019.
//  Copyright © 2019 Aivars Meijers. All rights reserved.
//

import XCTest
@testable import KeyChainApiTest

class KeyChainApiTestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testPaswordRetrive() {
        let  password = "123456"
        let account = "User"
        KeyChainApi.save(password, for: account)
        XCTAssertEqual(KeyChainApi.retrive(for: account), password)
    }

}
