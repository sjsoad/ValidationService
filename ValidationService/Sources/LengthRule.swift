//
//  LengthRule.swift
//  ValidationService
//
//  Created by Sergey Kostyan on 09.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation

public struct LengthRule: Validatable {
    
    private let minLength: Int
    private let maxLength: Int
    
    public init(minLength: Int, maxLength: Int) {
        self.minLength = minLength
        self.maxLength = maxLength
    }
    
    public func isValid(text: String) -> Bool {
        let lengthRange = minLength...maxLength
        return lengthRange.contains(text.count)
    }
    
}
