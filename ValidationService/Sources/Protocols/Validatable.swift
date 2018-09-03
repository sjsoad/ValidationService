//
//  Validatable.swift
//  SKValidationService-framework
//
//  Created by Sergey on 03.09.2018.
//

import Foundation

public protocol Validatable {
    
    func isValid(text: String) -> Bool
    
}
