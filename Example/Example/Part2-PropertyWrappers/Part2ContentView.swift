//
//  Part2ContentView.swift
//  Example
//
//  Created by TonSevenPeaks on 8/2/2564 BE.
//  Copyright © 2564 BE SevenPeaks Software. All rights reserved.
//

import SwiftUI

struct Part2ContentView: View {
    var body: some View {
        List {
            Section(header: Text("Property wrappers")) {
                NavigationLink(destination: PropertyWrapperExampleView(), label: {
                    Text("Example 1: Create a property wrapper")
                })
                
                NavigationLink(destination: OTPView(), label: {
                    Text("Example 2: projectedValue")
                })
            }
            
            Section(header: Text("Property wrappers in SwiftUI")) {
                NavigationLink(destination: StateView(), label: {
                    Text("@State")
                })
                
                NavigationLink(destination: BindingView(), label: {
                    Text("@Binding")
                })
                
                NavigationLink(destination: ObservedObjectView(), label: {
                    Text("@Published & @ObservedObject")
                })
                
                NavigationLink(destination: EnvironmentObjectView(), label: {
                    Text("@EnvironmentObject")
                })

            }
            
            Section(header: Text("MVVM in SwiftUI")) {
                NavigationLink(destination: MVVMContentView(), label: {
                    Text("MVVM project")
                })
                
            }

        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Property wrappers & MVVM", displayMode: .inline)
    }
}

struct Part2ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Part2ContentView()
    }
}
