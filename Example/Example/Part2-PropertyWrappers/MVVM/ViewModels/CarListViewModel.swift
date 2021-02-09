//
//  CarListViewModel.swift
//  MVVMSwiftUIExample
//
//  Created by TonSevenPeaks on 5/2/2564 BE.
//

import Foundation

class CarListViewModel: ObservableObject {
    @Published var carList = [CarViewModel]()
    
    init() {
        doRequest()
    }
    
    private func doRequest() {
        // Do some requests
        // After finish
        // Map response to our Model
        let cars = [Car(brand: "Tesla", model: "S"), Car(brand: "Audi", model: "R8"), Car(brand: "Tesla", model: "3")]
        carList = cars.map { CarViewModel.init(car: $0) }
    }
}

class CarViewModel {
    var car: Car
    
    init(car: Car) {
        self.car = car
    }
    
    var id: UUID {
        return car.id
    }
    
    var brand: String {
        return car.brand ?? ""
    }
    
    var model: String {
        return car.model ?? ""
    }
}
