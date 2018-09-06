//
//  ValidationService.swift
//  Pods
//
//  Created by Sergey on 03.09.2018.
//

import Foundation

public protocol ValidationService {
    
    func validate(text: String, with rules: [Validatable]) -> Bool
    
}

public extension ValidationService {
    
    func validate(text: String, with rules: [Validatable]) -> Bool {
        return !rules.compactMap({ $0.isValid(text: text) }).contains(false)
    }
    
}
