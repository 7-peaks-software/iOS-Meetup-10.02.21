//
//  CarListViewModel.swift
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
