//
//  Part 3. ContentView.swift
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

struct Part3 {
    
    struct ContentView: View {
        var body: some View {
            List {
                Section(header: Text("objectWillChange")) {
                    LazyNavigationLink(destination: StateObjectNonPublishedView(), label: {
                        Text("@StateObject and objectWillChange")
                    })
                    
                    LazyNavigationLink(destination: StateObjectPublishedView(), label: {
                        Text("@StateObject and @Published")
                    })

                    LazyNavigationLink(destination: ObservedObjectPublishedView(), label: {
                        Text("@ObservedObject and @Published")
                    })

                    LazyNavigationLink(destination: UnusedObservableObjectView(), label: {
                        Text("Unused @ObservableObject")
                    })
                }
                
                Section(header: Text("NavigationLink")) {
                    LazyNavigationLink(destination: NavigationLinkView(), label: {
                        Text("LazyView")
                    })
                    LazyNavigationLink(destination: DeepNavigationView(), label: {
                        Text("Deep Navigation")
                    })
                }
                
                Section(header: Text("ObservableObject And Parameters")) {
                    LazyNavigationLink(destination: StateObjectAndParametersView(), label: {
                        Text("@StateObject")
                    })
                    LazyNavigationLink(destination: ObservedObjectAndParametersView(), label: {
                        Text("@ObservedObject")
                    })
                    LazyNavigationLink(destination: CachedObservedObjectAndParametersView(), label: {
                        Text("Caching @ObservedObject")
                    })
                }
                
//                Section(header: Text("ObservableObject with parameters")) {
//                    NavigationLink(destination: NonPublishedExampleView(), label: {
//                        Text("StateObject")
//                    })
//
//                    NavigationLink(destination: PublishedExampleView(), label: {
//                        Text("ObservedObject")
//                    })
//
//                    NavigationLink(destination: UnusedObservableObjectView(), label: {
//                        Text("Caching ObservedObject")
//                    })
//                }
                
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Performance and Memory Management", displayMode: .inline)
        }
    }
}


