//
//  ValidationServiceTests.swift
//  ValidationServiceTests
//
//  Created by Sergey on 06.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import XCTest
@testable import ValidationService

class ValidationServiceTests: XCTestCase {
    
    private let validationService: ValidationService = DefaultValidationService()
    
    func testRegularExpressionRule() {
        let emailRule = RegularExpressionRule(predicateFormat: "SELF MATCHES %@",
                                              regularExpression: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        let positive = validationService.validate(text: "testEmail123@gmail.com", with: [emailRule])
        XCTAssertTrue(positive, "Incorrect validation")
        let negative = validationService.validate(text: "testEmail123", with: [emailRule])
        XCTAssertFalse(negative, "Incorrect validation")
        let anotherNegative = validationService.validate(text: "@gmail.com", with: [emailRule])
        XCTAssertFalse(anotherNegative, "Incorrect validation")
    }
    
    func testLengthRule() {
        let emailRule = LengthRule(minLength: 2, maxLength: 10)
        let positive = validationService.validate(text: "some text", with: [emailRule])
        XCTAssertTrue(positive, "Incorrect validation")
        let negative = validationService.validate(text: "some long text", with: [emailRule])
        XCTAssertFalse(negative, "Incorrect validation")
        let minNegative = validationService.validate(text: "1", with: [emailRule])
        XCTAssertFalse(minNegative, "Incorrect validation")
    }
    
}
