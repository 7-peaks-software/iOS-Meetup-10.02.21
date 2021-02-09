//
//  SettingView.swift
//  MVVMSwiftUIExample
//
//  Created by TonSevenPeaks on 5/2/2564 BE.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var userSettings: UserSettings
    @Binding var isPresentedSetting: Bool
    @State private var textString: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter new name", text: $textString).padding(.bottom, 32)
            Button("Save") {
                userSettings.userName = textString
                isPresentedSetting.toggle()
            }
        }.padding(16)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(isPresentedSetting: .constant(false))
    }
}
