//
//  ValidationService.swift
//  ValidationService
//
//  Created by Sergey Kostyan on 09.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

public protocol Validatable {
    
    func isValid(text: String) -> Bool
    
}

public protocol ValidationService {
    
    func validate(text: String, with rules: [Validatable], compoundRules: Bool) -> Bool
    
}

open class DefaultValidationService: ValidationService {

    public func validate(text: String, with rules: [Validatable], compoundRules: Bool = true) -> Bool {
        let results = rules.compactMap({ $0.isValid(text: text) })
        return results.contains(!compoundRules)
    }
    
}
