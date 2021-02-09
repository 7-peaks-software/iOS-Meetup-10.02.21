//
//  EnvironmentObjectView.swift
//  Example
//
//  Created by TonSevenPeaks on 8/2/2564 BE.
//  Copyright © 2564 BE SevenPeaks Software. All rights reserved.
//

import SwiftUI
struct EnvironmentObjectView: View {
    var body: some View {
        NavigationLink("Detail", destination: EnvironmentObjectDetailView())
    }
}

struct EnvironmentObjectDetailView: View {
    @EnvironmentObject var userSettings: UserSettings
    var body: some View {
        Text("Hello, \(userSettings.userName)")
            .padding()
    }
}
