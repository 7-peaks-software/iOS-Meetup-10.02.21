//
//  MVVMContentView.swift
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

struct MVVMContentView: View {
    @EnvironmentObject var userSettings: UserSettings
    @ObservedObject var viewModel: CarListViewModel
    @State private var isPresented: Bool = false
    @State private var isPresentedSetting: Bool = false
    init() {
        viewModel = CarListViewModel()
    }

    var body: some View {
        List {
            Text("Hello, \(userSettings.userName)!")
                .padding()
            
            ForEach(viewModel.carList, id: \.id) { car in
                NavigationLink("\(car.brand)", destination: DetailView(car: car))
            }
            
            Button("Login") {
                isPresented.toggle()
            }.sheet(isPresented: $isPresented, content: {
                LoginView(isPresented: $isPresented)
            })
            .padding([.top, .bottom], 16)
        }
        .navigationBarItems(trailing: Button("SettingView") { isPresentedSetting = true }.sheet(isPresented: $isPresentedSetting) {
            SettingView(isPresentedSetting: $isPresentedSetting)
        })
        
    }
}

struct MVVMContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
