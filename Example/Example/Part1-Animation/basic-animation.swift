//
//  basic-animation.swift
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

public struct BasicContentView: View {
    public init() {
        
    }
    
    public var body: some View {
        List {
            Section(header: Text("Basic Overview")) {
                NavigationLink(destination: AnimationProperties(), label: {
                    Text("Basic properties")
                })
                
                NavigationLink(destination: TimingView(), label: {
                    Text("Options")
                })
            }
            
            Section(header: Text("Animatable and Animatable Data")) {
                NavigationLink(destination: CustomAnimationView(), label: {
                    Text("Custom animation")
                })
                
                NavigationLink(destination: AnimatableQuizView(), label: {
                    Text("Quiz")
                })
            }
            
            Section(header: Text("GeometryEffect")) {
                NavigationLink(destination: TransformSkewView(), label: {
                    Text("ProjectionTransform")
                })
                
                NavigationLink(destination: AnimatableQuizEffectView(), label: {
                    Text("Quiz #2")
                })
                
                NavigationLink(destination: TransformationOrdering(), label: {
                    Text("Transformation Ordering")
                })
            }
            
            Section(header: Text("Animatable Modifier")) {
                NavigationLink(destination: PercentageView(), label: {
                    Text("Progress view modifier")
                })
            }

        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("SwiftUI Basic Animation", displayMode: .inline)
    }
}
