//
//  Animatable.swift
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

// MARK: - Basic overview

struct AnimationProperties: View {
    @State private var isOn = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20.0) {
            HStack {
                VStack {
                    Text("Translation").frame(maxWidth: .infinity)
                    PCircle().offset(x: isOn ? -100 : 100, y: 0)
                }
            }
            
            
            HStack {
                VStack {
                    Text("Scaling").frame(maxWidth: .infinity)
                    PCircle().scaleEffect(isOn ? 1.5 : 0.5)
                }
                
                VStack {
                    Text("Rotation").frame(maxWidth: .infinity)
                    PCircle().rotationEffect(isOn ? .init(degrees: 360) : .zero)
                }
            }

            HStack {
                VStack {
                    Text("Opacity").frame(maxWidth: .infinity)
                    PCircle().opacity(isOn ? 1.0 : 0.2)
                }
                
                VStack {
                    Text("Background").frame(maxWidth: .infinity)
                    PCircle().background(isOn ? Color.gray : Color.white)
                }
            }
            
            Spacer().frame(maxWidth: .infinity)
        }
        .padding()
        .navigationBarTitle("Basic properties", displayMode: .inline)
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 1.0).repeatForever()) {
                self.isOn.toggle()
            }
        }
    }
}

struct TransformationOrdering: View {
    @State private var isOn = true
    private let animation = Animation.easeInOut(duration: 1).repeatForever()
    
    var body: some View {
        
        VStack {
            Text("Translation -> Scaling")
            PCircle()
                .offset(x: isOn ? 100 : 0, y: 0)
                .scaleEffect(isOn ? 1.5 : 0.5)

            Text("Scaling -> Translation")
            PCircle()
                .scaleEffect(isOn ? 1.5 : 0.5)
                .offset(x: isOn ? 100 : 0, y: 0)
            
            Text("Translation -> Rotation")
            PCircle()
                .offset(x: isOn ? 100 : 0, y: 0)
                .rotationEffect(isOn ? .init(degrees: 360) : .zero)

            Text("Rotation -> Translation")
            PCircle()
                .rotationEffect(isOn ? .init(degrees: 360) : .zero)
                .offset(x: isOn ? 100 : 0, y: 0)
            
            Spacer().frame(maxWidth: .infinity)
        }
        .padding()
        .navigationBarTitle("Transformation Ordering", displayMode: .inline)
        .onAppear {
            withAnimation(animation) {
                self.isOn.toggle()
            }
        }
    }
}


struct TimingView: View {
    @State private var linear: CGFloat = 0.0
    @State private var easeIn = false
    @State private var easeOut = false
    @State private var easeInOut = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Group {
                Text("Linear")
                PCircle().offset(x: linear, y: 0)
                Text("EaseIn")
                PCircle().offset(x: easeIn ? 200 : 0, y: 0)

                Text("EaseOut")
                PCircle().offset(x: easeOut ? 200 : 0, y: 0)

                Text("EaseInOut")
                PCircle().offset(x: easeInOut ? 200 : 0, y: 0)
            }
            
            Spacer().frame(maxWidth: .infinity, alignment: .leading)
            
            Group {
                NavigationLink(destination: SpringView(), label: {
                    Text("Springs")
                })
            }
            .padding()
        }
        .padding()
        .navigationBarTitle("Options", displayMode: .inline)
        .onAppear {
            withAnimation(Animation.linear(duration: 2.0).repeatForever()) {
                self.linear = 200
            }
            
            withAnimation(Animation.easeIn(duration: 2.0).repeatForever()) {
                self.easeIn.toggle()
            }
            
            withAnimation(Animation.easeOut(duration: 2.0).repeatForever()) {
                self.easeOut.toggle()
            }
            
            withAnimation(Animation.easeInOut(duration: 2.0).repeatForever()) {
                self.easeInOut.toggle()
            }
        }
    }
    
    struct SpringView: View {
        
        @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        @State private var isOn = false
        
        var body: some View {
            VStack(alignment: .leading) {
                Group {
                    Text("#1")
                    PCircle().offset(x: isOn ? 200 : 0, y: 0)
                    
                    Text("#2")
                    PCircle().rotationEffect(isOn ? Angle(degrees: 360) : .zero)
                    
                    Text("#3")
                    PCircle().scaleEffect(isOn ? 1.5 : 0.5)
                }
                Spacer().frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .navigationBarTitle("Springs", displayMode: .inline)
            .navigationBarItems(leading:
                Button("Back") {
                    presentationMode.wrappedValue.dismiss()
                }
            )
            .onAppear {
                withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1.0).repeatForever()) {
                    self.isOn.toggle()
                }
            }
        }
    }
}

// MARK: - Animatable and VectorArithmetic

public struct AnimatableQuizView: View {
    @State private var isOn = false
    
    public var body: some View {
        
        VStack {
            PCircle().transformEffect(isOn ? .init(translationX: 100, y: 0) : .identity)
            Button("Will it animate 🤔? Click me") {
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

struct CustomAnimationView: View {
    @State var edges = 5
    
    var body: some View {
        VStack {
            
            Star(edges: edges)
                .stroke(Color.purple, lineWidth: 5)
                .frame(width: 300, height: 300)
            
            Spacer()
            
            Picker("# edges \(edges)", selection: $edges.animation(.easeInOut)) {
                Text("5").tag(5)
                Text("10").tag(10)
                Text("100").tag(100)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer().frame(maxWidth: .infinity)
            
            HStack {
                NavigationLink(destination: StarView(), label: {
                    Text("Next 😉 ▶️")
                })
            }
        }
        .padding()
        .navigationBarTitle("Custom Animation", displayMode: .inline)
    }
}

struct StarView: View {
    @State var edges = 5
    @State var duration = 2.0
    
    var body: some View {
        AnimatableStar(edges: edges)
            .stroke(Color.purple, lineWidth: 5)
            .frame(width: 300, height: 300)
            .padding(20)
        
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Text("# edges \(edges)")
                Spacer()
                
                Picker(selection: $edges.animation(Animation.easeInOut(duration: duration)), label: Text("# edges \(edges)")) {
                    Text("5").tag(5)
                    Text("10").tag(10)
                    Text("100").tag(100)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            HStack(spacing: 20) {
                Text("Duration \(String(format: "%.1f", duration))")
                Spacer()
                
                Picker(selection: $duration, label: Text("Duration \(duration)")) {
                    Text("2").tag(2.0)
                    Text("5").tag(5.0)
                    Text("10").tag(10.0)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
        }
        .padding()
        .navigationBarTitle("Animatable Star ⭐️", displayMode: .inline)
    }
}

struct Star: Shape {
    let edges: Int
    
    func path(in rect: CGRect) -> Path {
        let outerR = Double(min(rect.size.width, rect.size.height)) * 0.5
        let innerR = outerR * 0.5
        let c = CGPoint(x: rect.size.width * 0.5, y: rect.size.height * 0.5)

        var path = Path()
        
        let angleStep = Angle(degrees: 360 / Double(edges))
        
        (0 ..< edges).forEach { i in
            let from = angleStep * Double(i)
            let to = min(Angle(degrees: 360), from + angleStep)
            let mid = (from + to) / 2
            
            let fromPoint = CGPoint(x: c.x + CGFloat(cos(from.radians) * innerR), y: c.y + CGFloat(sin(from.radians) * innerR))
            let midPoint = CGPoint(x: c.x + CGFloat(cos(mid.radians) * outerR), y: c.y + CGFloat(sin(mid.radians) * outerR))

            i == 0 ? path.move(to: fromPoint) : path.addLine(to: fromPoint)
            path.addLine(to: midPoint)
        }
        
        path.closeSubpath()
        
        return path
    }
}

struct AnimatableStar: Shape {
    private var edges: Double
    init(edges: Int) {
        self.edges = Double(edges)
    }
    
    func path(in rect: CGRect) -> Path {
        let outerR = Double(min(rect.size.width, rect.size.height)) * 0.5
        let innerR = outerR * 0.5
        let c = CGPoint(x: rect.size.width * 0.5, y: rect.size.height * 0.5)

        var path = Path()

        var n = Int(edges)
        if edges > Double(Int(edges)) {
            n += 1
        }
        
        let angleStep = Angle(degrees: 360 / edges)
        
        (0 ..< n).forEach { i in
            let from = angleStep * Double(i)
            let to = min(Angle(degrees: 360), from + angleStep)
            let mid = (from + to) / 2
            
            let fromPoint = CGPoint(x: c.x + CGFloat(cos(from.radians) * innerR), y: c.y + CGFloat(sin(from.radians) * innerR))
            let midPoint = CGPoint(x: c.x + CGFloat(cos(mid.radians) * outerR), y: c.y + CGFloat(sin(mid.radians) * outerR))

            i == 0 ? path.move(to: fromPoint) : path.addLine(to: fromPoint)
            path.addLine(to: midPoint)
        }
        
        path.closeSubpath()
        
        return path
    }
    
    var animatableData: Double {
        set { edges = newValue }
        get { return edges }
    }
}

