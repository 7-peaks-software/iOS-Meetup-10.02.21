//
//  OTPView.swift
//  Example
//
//  Created by TonSevenPeaks on 8/2/2564 BE.
//  Copyright © 2564 BE SevenPeaks Software. All rights reserved.
//

import SwiftUI

struct OTPView: View {
    @State private var phoneNumber: String = ""
    @State private var phoneNumberValidator: PhoneValidator = PhoneValidator(phoneNumberValidator: "")

    var body: some View {
        VStack {
            Text("Enter your phone number to request an OTP")
            
            TextField("Enter your phone number", text: $phoneNumber).onChange(of: phoneNumber, perform: { value in
                self.phoneNumberValidator = PhoneValidator(phoneNumberValidator: phoneNumber)
                phoneNumber = self.phoneNumberValidator.phoneNumberValidator
            }).padding(16)
            
            if phoneNumberValidator.$phoneNumberValidator {
                Button("Request OTP", action: {
                    print("Reqeust OTP: \(self.phoneNumberValidator.phoneNumberValidator)")
                })
            }
            
//            // To make it easier. We can use @ViewBuilder
//            Button("Request OTP", action: {
//                print("Reqeust OTP: \(self.phoneNumberValidator.phoneNumberValidator)")
//            }).isHidden(!phoneNumberValidator.$phoneNumberValidator)
        }
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView()
    }
}

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool = false) -> some View {
        switch isHidden {
        case true: self.hidden()
        case false: self
        }
    }
}
