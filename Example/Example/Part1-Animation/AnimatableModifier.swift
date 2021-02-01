//
//  AnimatableModifier.swift
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

// MARK: - AnimatableModifier
struct PercentageModifier: AnimatableModifier {
    enum Style {
        case circular
        case sliding
    }
    
    private (set) var pct = 0.0
    private (set) var style: Style
    
    init(pct: Double, style: Style = .sliding) {
        self.pct = max(min(pct, 1), 0)
        self.style = style
    }
    
    var animatableData: Double {
        get { pct }
        set { pct = newValue }
    }
    
    func body(content: Content) -> some View {
        switch style {
        case .sliding:
            return AnyView(content.clipShape(SlidingShape(pct: pct)))
        case .circular:
            return AnyView(content.clipShape(CircularShape(pct: pct), style: FillStyle(eoFill: true, antialiased: true)))
        }
    }
    
    private struct CircularShape: Shape {
        let pct: Double
        
        func path(in rect: CGRect) -> Path {
            
            let center = CGPoint(x: rect.midX, y: rect.midY)
            let r = sqrt(rect.width * rect.width + rect.height * rect.height) * 0.5
            
            var p = Path()
            p.move(to: center)
            p.addLine(to: CGPoint(x: center.x + r, y: center.y))
            
            p.addRelativeArc(center: CGPoint(x: rect.midX, y: rect.midY),
                             radius: r,
                             startAngle: Angle(degrees: 0),
                             delta: Angle(degrees: 360 * pct))
            
            p.closeSubpath()
            
            return p
        }
    }
    
    private struct SlidingShape: Shape {
        let pct: Double
        
        func path(in rect: CGRect) -> Path {
            let h = rect.height * CGFloat(pct)
            return Path(CGRect(origin: rect.origin, size: CGSize(width: rect.width, height: h)))
        }
    }
}

extension View {
    func percentage(_ pct: Double, style: PercentageModifier.Style) -> some View {
        return modifier(PercentageModifier(pct: pct, style: style))
    }
}

struct PercentageView: View {
    @State private var pct = 0.0
    
    var body: some View {
        
        VStack(spacing: 20) {
            HStack(spacing: 40) {
                Circle()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.yellow)
                    .percentage(pct, style: .circular)
                
                Image(systemName: "hand.thumbsup.fill")
                    .resizable()
                    .foregroundColor(.purple)
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .percentage(pct, style: .sliding)
            }
            
            Text("🕛 Happy New Year 🎉🎇🎆💥!")
                .font(.system(size: 30))
                .percentage(pct, style: .sliding)
            
            HStack(spacing: 40) {
                
                Image(systemName: "thermometer")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.red)
                    .frame(width: 100, height: 100)
                    .percentage(pct, style: .sliding)
                
                Text("🤪")
                    .font(.system(size: 100))
                    .padding(20)
                    .percentage(pct, style: .circular)
            }
        }
        .padding()
        
        Spacer()
        
        HStack {
            Picker(selection: $pct.animation(Animation.easeInOut(duration: 2)), label: Text("Percent \(pct)")) {
                Text("0%").tag(0.0)
                Text("20%").tag(0.2)
                Text("50%").tag(0.5)
                Text("75%").tag(0.75)
                Text("100%").tag(1.0)
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .padding()
        .navigationTitle("Progress")
    }
}
