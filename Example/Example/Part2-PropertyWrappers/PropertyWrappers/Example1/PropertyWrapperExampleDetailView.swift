//
//  PropertyWrapperExampleDetailView.swift
//  Example
//
//  Created by TonSevenPeaks on 8/2/2564 BE.
//  Copyright © 2564 BE SevenPeaks Software. All rights reserved.
//

import SwiftUI

struct PropertyWrapperExampleDetailView: View {
    var body: some View {
        Text("App language: \(AppSettings.appLanguage)")
    }
}

struct PropertyWrapperExampleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyWrapperExampleDetailView()
    }
}
