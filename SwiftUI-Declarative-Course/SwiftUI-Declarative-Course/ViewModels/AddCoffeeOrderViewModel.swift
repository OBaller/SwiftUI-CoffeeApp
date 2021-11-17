//
//  AddCoffeeOrderViewModel.swift
//  SwiftUI-Declarative-Course
//
//  Created by naseem on 17/11/2021.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {
    
    var name: String = ""
    @Published var size: String = "Medium"
    @Published var coffeeName: String = ""
    
    private var networkService: NetworkService
    
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    init() {
        self.networkService = NetworkService()
    }
    
    var total: Double {
        return calculateTotalPrice()
    }
    
    func placeOrder() {
        
        let order = Order(name: self.name, coffeeName: self.coffeeName, total: self.total, size: self.size)
        
        self.networkService.createCoffeeOrder(order: order) { _ in
            
        }
        
    }
    
    private func priceForSize() -> Double {
        let prices = ["Small":2.0, "Medium":3.0, "Large":4.0]
        return prices[self.size]!
    }
    
    private func calculateTotalPrice() -> Double {
        let coffeeVM = coffeeList.first { $0.name == coffeeName }
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        } else {
            return 0.0
        }
    }
    
}
