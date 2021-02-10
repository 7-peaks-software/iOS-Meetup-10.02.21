//
//  3.2.2.2 DeepNavigationNestedView.swift
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
    
    struct DeepNavigationNestedView: View {
        var body: some View {
            NestedView1()
                .navigationBarTitle("Nested NavigationLink" , displayMode: .inline)
        }
    }
    
    struct NestedView1: View {
        @State var showNext: Bool = false
        var body: some View {
            DeepNavigationChildView(title: "Child 1", onNext: $showNext)
            
            NavigationLink("", destination: NestedView2(),
                           isActive: $showNext)
        }
    }
    
    struct NestedView2: View {
        @State var showNext: Bool = false
        var body: some View {
            DeepNavigationChildView(title: "Child 2", onNext: $showNext)
            
            NavigationLink("", destination: NestedView3(),
                           isActive: $showNext)
        }
    }
    
    struct NestedView3: View {
        @State var showNext: Bool = false
        var body: some View {
            DeepNavigationChildView(title: "Child 3", onNext: $showNext)
                .fullScreenCover(isPresented: $showNext) {
                    Button(action: { showNext = false }) {
                        Text("Close")
                    }
                }
        }
    }
    
}
