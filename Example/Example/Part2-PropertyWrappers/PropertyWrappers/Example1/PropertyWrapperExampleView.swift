//
//  PropertyWrapperExampleView.swift
//  Example
//
//  Created by TonSevenPeaks on 8/2/2564 BE.
//  Copyright © 2564 BE SevenPeaks Software. All rights reserved.
//

import SwiftUI

struct PropertyWrapperExampleView: View {
    @State var selectedTag: Int = 0

    var body: some View {
        VStack {
            Text("Select App language!")

            NavigationLink(destination: PropertyWrapperExampleDetailView()) {
                Text("en")
            }.simultaneousGesture(TapGesture().onEnded {
                AppSettings.appLanguage = "en"
            })
            NavigationLink(destination: PropertyWrapperExampleDetailView()) {
                Text("th")
            }.simultaneousGesture(TapGesture().onEnded {
                AppSettings.appLanguage = "th"
            })

        }
    }
}

struct PropertyWrapperExampleView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyWrapperExampleView()
    }
}
