//
//  ObservedObjectView.swift
//  Example
//
//  Created by TonSevenPeaks on 8/2/2564 BE.
//  Copyright © 2564 BE SevenPeaks Software. All rights reserved.
//

import SwiftUI

struct ObservedObjectView: View {
    @ObservedObject var somePublished = SomePublished()
    var body: some View {
        Text("Hello, \(somePublished.userName)!")
            .padding()
   }
}

class SomePublished: ObservableObject {
    @Published var userName: String = ""
    init() {
        userName = "Ton"
    }
}
