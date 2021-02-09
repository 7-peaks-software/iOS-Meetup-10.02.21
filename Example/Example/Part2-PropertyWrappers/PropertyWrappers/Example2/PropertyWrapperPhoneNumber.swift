//
//  PropertyWrapperPhoneNumber.swift
//  Example
//
//  Created by TonSevenPeaks on 8/2/2564 BE.
//  Copyright © 2564 BE SevenPeaks Software. All rights reserved.
//

import Foundation
@propertyWrapper struct PropertyWrapperPhoneNumber {
    
    var projectedValue: Bool = false
    var storedValue: String = ""
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
    
    var wrappedValue: String {
        get { storedValue }
        set {
            projectedValue = newValue.count == 10 ? true : false
            storedValue = newValue.count < 10 ? newValue : String(newValue.prefix(10))
        }
    }
}
