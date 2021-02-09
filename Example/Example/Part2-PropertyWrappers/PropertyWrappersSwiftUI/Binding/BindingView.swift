//
//  BindingView.swift
//  Example
//
//  Created by TonSevenPeaks on 8/2/2564 BE.
//  Copyright © 2564 BE SevenPeaks Software. All rights reserved.
//

import SwiftUI

struct BindingView: View {
    @State private var randomNumber: Int = 0
    var body: some View {
        Text("1st horse number is: \(randomNumber)")
        CustomBindingView(randomNumber: $randomNumber)
    }
}

struct CustomBindingView: View {
    @Binding var randomNumber: Int
    var body: some View {
        Button("Hit me") {
            self.randomNumber = Int.random(in: 1...100)
        }
    }
}
