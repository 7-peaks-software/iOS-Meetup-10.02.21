//
//  StateView.swift
//  Example
//
//  Created by TonSevenPeaks on 8/2/2564 BE.
//  Copyright © 2564 BE SevenPeaks Software. All rights reserved.
//

import SwiftUI

struct StateView: View {
    @State private var counter: Int = 0
    var body: some View {
        VStack {
            Text("Counter: \(counter)")
            HStack {
                Button("Decrease counter", action: {
                    counter -= 1
                })
                Button("Increase counter", action: {
                    counter += 1
                })
            }
        }.padding(16)
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView()
    }
}
