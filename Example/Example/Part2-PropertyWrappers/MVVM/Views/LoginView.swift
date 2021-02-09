//
//  LoginView.swift
//  MVVMSwiftUIExample
//
//  Created by TonSevenPeaks on 5/2/2564 BE.
//

import SwiftUI

struct LoginView: View {
    @Binding var isPresented: Bool

    var body: some View {
        Text("Hello, World!")
        Button("Back") {
            isPresented.toggle()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isPresented: .constant(false))
    }
}
