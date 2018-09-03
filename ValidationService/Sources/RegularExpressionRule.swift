//
//  RegularExpressionRule.swift
//  ValidationService
//
//  Created by Sergey Kostyan on 09.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

public struct RegularExpressionRule: Validatable {
    
    private let predicateFormat: String
    private let regularExpression: String
    
    public init(predicateFormat: String, regularExpression: String) {
        self.predicateFormat = predicateFormat
        self.regularExpression = regularExpression
    }
    
    public func isValid(text: String) -> Bool {
        let validationPredicate = NSPredicate(format: predicateFormat, regularExpression)
        return validationPredicate.evaluate(with: text)
    }
    
}
