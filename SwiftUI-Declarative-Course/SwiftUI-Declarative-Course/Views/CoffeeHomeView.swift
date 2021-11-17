//
//  CoffeeHomeView.swift
//  SwiftUI-Declarative-Course
//
//  Created by naseem on 15/11/2021.
//

import SwiftUI

struct CoffeeHomeView: View {
    @State private var showModal: Bool = false
    @ObservedObject  private var orderListVM = OrderListViewModel()
    var body: some View {
        NavigationView {
            OrderListView(orders: self.orderListVM.orders)
                .navigationBarTitle("Coffee Orders")
                .navigationBarItems(leading: Button(action: reloadOrders) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(Color.white)
                }, trailing: Button(action: showAddCoffeeOrderView) {
                    Image(systemName: "plus")
                    foregroundColor(Color.white)
                })
                
                .sheet(isPresented: $showModal, content: {
                    AddCoffeeOrderView(isPresented: $showModal)
                })
        }
    }
    
    private func reloadOrders() {
        self.orderListVM.fetchOrders()
    }
    
    private func showAddCoffeeOrderView() {
        self.showModal = true
    }
}

struct CoffeeHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeHomeView()
    }
}
