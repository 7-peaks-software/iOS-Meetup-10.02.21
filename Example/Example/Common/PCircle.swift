//
//  PCircle.swift
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

public struct PCircle: View {
    public init(s: CGFloat = 60.0, color: Color = .purple) {
        self.s = s
        self.c = color
    }
    
    private let s: CGFloat // size in square
    private let c: Color
    private var lineWidth: CGFloat {
        return s / 6
    }

    public var body: some View {
        Path { p in
            let r = CGRect(origin: .zero, size: CGSize(width: s, height: s))

            p.addEllipse(in: r.insetBy(dx: lineWidth, dy: lineWidth))
            p.addLines([CGPoint(x: 0, y: r.midY), CGPoint(x: r.maxX, y: r.midY)])
        }
        .stroke(c, lineWidth: lineWidth)
        .frame(width: s, height: s, alignment: .center)
        .padding(s * 0.25)
    }
}
