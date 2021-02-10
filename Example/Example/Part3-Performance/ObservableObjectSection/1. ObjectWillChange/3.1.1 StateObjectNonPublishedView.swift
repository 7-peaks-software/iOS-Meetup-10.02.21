//
//  3.1.1 StateObjectNonPublishedView.swift
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
import Combine

extension Part3 {
    
    struct StateObjectNonPublishedView: View {
        @StateObject var object = NonPublishedObject()
        
        var body: some View {
            Text("Counter: \(object.nonpublishedValue)")
                .navigationBarTitle("StateObject and NonPublished" , displayMode: .inline)
        }
        
        class NonPublishedObject: ObservableObject {
            private var subscriptions = Set<AnyCancellable>()
            var nonpublishedValue: Int = 0
            
            init() {
                Timer
                    .publish(every: 1.0, on: .main, in: .common)
                    .autoconnect()
                    .sink { [weak self] _ in
                        guard let self = self else { return }
                        self.nonpublishedValue += 1
                        self.objectWillChange.send()
                    }
                    .store(in: &subscriptions)
            }
        }
    }
}


