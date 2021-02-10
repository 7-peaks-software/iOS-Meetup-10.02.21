//
//  3.1.4 UnusedObservableObjectView.swift
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

import SwiftUI

extension Part3 {
    
    struct UnusedObservableObjectView: View {
        @StateObject var object = StateObjectPublishedView.PublishedObject()
        
        var body: some View {
            ChildView()
                .navigationBarTitle("Unused ObservableObject" , displayMode: .inline)
        }
        
        struct ChildView: View {
            @ObservedObject var viewModel = ViewModel()
            
            var body: some View {
                VStack {
                    Text("ViewModel created \(viewModel.counter) times")
                        .padding()
                    Button( action: { viewModel.reset() }) {
                        Text("Reset")
                    }
                }
            }
            
            class ViewModel: ObservableObject {
                static var counter: Int = 0
                @Published var counter: Int
                
                init() {
                    Self.counter += 1
                    counter = Self.counter
                    
                    print("[init] \(self)")
                }
                
                func reset() {
                    Self.counter = 0
                    counter = 0
                }
                
                deinit {
                    print("[deinit] \(self)")
                }
            }
        }
    }
}


