//
//  DetailView.swift
//  MVVMSwiftUIExample
//
//  Created by TonSevenPeaks on 5/2/2564 BE.
//

import SwiftUI

struct DetailView: View {
    var car: CarViewModel

    init(car: CarViewModel) {
        self.car = car
    }

    var body: some View {
        Text("Car model: \(car.model)")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(car: CarViewModel(car: Car(brand: "1", model: "1")))
    }
}
