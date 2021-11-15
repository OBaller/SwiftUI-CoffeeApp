//
//  CoffeeHomeView.swift
//  SwiftUI-Declarative-Course
//
//  Created by naseem on 15/11/2021.
//

import SwiftUI

struct CoffeeHomeView: View {
    @ObservedObject  private var orderListVM = OrderListViewModel()
    var body: some View {
        NavigationView {
            OrderListView(orders: self.orderListVM.orders)
                .navigationBarTitle("Coffee Orders")
        }
    }
}

struct CoffeeHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeHomeView()
    }
}
