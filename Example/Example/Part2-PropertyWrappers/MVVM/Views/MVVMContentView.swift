//
//  MVVMContentView.swift
//  MVVMSwiftUIExample
//
//  Created by TonSevenPeaks on 5/2/2564 BE.
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
