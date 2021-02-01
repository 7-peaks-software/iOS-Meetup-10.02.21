//
//  Transformation.swift
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

// MARK: - GeometryEffect
struct AnimatableQuizEffect: GeometryEffect {
    private (set) var dX: Double
    
    var animatableData: Double {
        get { dX }
        set { dX = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        return ProjectionTransform(CGAffineTransform.init(translationX: CGFloat(dX), y: 0))
    }
}

struct AnimatableQuizEffectView: View {
    @State private var isOn = false
    
    var body: some View {
        
        VStack {
            PCircle().modifier(AnimatableQuizEffect(dX: isOn ? 100 : 0))
            
            Button("It will animate 😉? Click me") {
                withAnimation {
                    self.isOn.toggle()
                }
            }
            Spacer().frame(maxWidth: .infinity)
        }
        .padding()
        .navigationTitle("Animatable Quiz")
    }
}

struct TransformSkewEffect: GeometryEffect {
    private (set) var b: Double
    private (set) var c: Double
    
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(b, c) }
        set { b = newValue.first; c = newValue.second }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        
        let t = CGAffineTransform(a: 1,
                                  b: CGFloat(sin(Double.pi * 2 * b)),
                                  c: CGFloat(cos(Double.pi * 2 * c)),
                                  d: 1, tx: 0, ty: 0)
        return ProjectionTransform(t)
    }
}

struct TransformSkewView: View {
    @State private var isOn = false
    
    var body: some View {
        VStack {
            PCircle(s: 120)
                .modifier(TransformSkewEffect(b: isOn ? 1 : 0, c: isOn ? 1 : 0))
        }
        .padding()
        .navigationTitle("Skew effect")
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 2).repeatForever()) {
                self.isOn.toggle()
            }
        }
    }
}
