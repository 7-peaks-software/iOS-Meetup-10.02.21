//
//  3.3.1 StateObjectAndParametersView.swift
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
    
    struct StateObjectAndParametersView: View {
        @StateObject private var viewModel = ViewModel()
        private let id: Int
        
        init(id: Int = 1) {
            self.id = id
        }
        
        var body: some View {
            TextField("Title: ", text: $viewModel.title)
                .onAppear() {
                    viewModel.id = id
                }
                .navigationBarTitle("@StateObject" , displayMode: .inline)
        }
        
        class ViewModel: ObservableObject {
            @Published var title: String = ""
            
            var id: Int? {
                didSet {
                    if let id = id {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            self.title = "Title #\(id)"
                        }
                    } else {
                        title = ""
                    }
                }
            }
            
            init() {
                print("+ \(self)")
            }
        }
    }
}
