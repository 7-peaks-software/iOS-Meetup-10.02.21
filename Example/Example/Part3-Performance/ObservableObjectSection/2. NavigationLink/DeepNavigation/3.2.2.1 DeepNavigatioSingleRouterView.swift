//
//  3.2.2.1 DeepNavigatioSingleRouterView.swift.swift
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

extension Part3 {
    
    struct DeepNavigatioSingleRouterView: View {
        @State var goTo2: Bool = false
        @State var goTo3: Bool = false
        @State var on3Done: Bool = false
        
        var body: some View {
            VStack {
                DeepNavigationChildView(title: "Child 1", onNext: $goTo2)
                    .fullScreenCover(isPresented: $on3Done) {
                        Button(action: { on3Done = false }) {
                            Text("Close")
                        }
                    }
                    .navigationBarTitle("Single Router" , displayMode: .inline)
                
                NavigationLink("", destination: DeepNavigationChildView(title: "Child 2", onNext: $goTo3),
                               isActive: $goTo2)
                
                NavigationLink("", destination: DeepNavigationChildView(title: "Child 3", onNext: $on3Done),
                               isActive: $goTo3)
            }
        }
    }
}

