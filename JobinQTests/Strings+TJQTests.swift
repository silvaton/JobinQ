//
//  Strings+TJQTests.swift
//  JobinQTests
//
//  Created by Ton Silva on 17/5/22.
//

import XCTest
@testable import JobinQ

class Strings_TJQTests: XCTestCase {
    
    func testIsValidEmail() {
        let correctEmail = "jobin@jobinq.com"
        let incorrectEmail = "jobin"
        let emptyEmail = ""
        
        XCTAssertTrue(correctEmail.isValidEmail(), "It's not a valid e-mail")
        XCTAssertFalse(incorrectEmail.isValidEmail(), "It's a valid e-mail")
        XCTAssertFalse(emptyEmail.isValidEmail(), "There is no email provided")
    }
    
    func testIsValidPassword() {
        let correctPassword = "kpwi193"
        let incorrectPassword = "111111"
        
        XCTAssertTrue(correctPassword.isValidPassword(), "It's an invalid password")
        XCTAssertFalse(incorrectPassword.isValidPassword(), "It's a valid password")
    }
}
