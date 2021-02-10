//
//  OTPView.swift
//  Example MeetUp 10.02.2021
//
//  Copyright (c) 2021 SevenPeaks Software
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
