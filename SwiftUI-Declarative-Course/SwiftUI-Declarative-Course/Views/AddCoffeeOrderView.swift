//
//  AddCoffeeOrderView.swift
//  SwiftUI-Declarative-Course
//
//  Created by naseem on 17/11/2021.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("INFORMATION").font(.body)) {
                        TextField("Enter Name", text: $addCoffeeOrderVM.name)
                    }
                    
                    Section(header: Text("SELECT COFFEE").font(.body)) {
                        ForEach(addCoffeeOrderVM.coffeeList, id:\.name) { coffee in
                            CoffeeCellView(selection: self.$addCoffeeOrderVM.coffeeName, coffee: coffee)
                        }
                    }
                    
                    Section(header: Text("SELECT COFFEE").font(.body), footer: Text("TOTAL").font(.body)) {
                        Picker("", selection: $addCoffeeOrderVM.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                HStack {
                Button("Place Order") {
                    self.addCoffeeOrderVM.placeOrder()
//                    self.isPresented = false
                }
                    
                }.padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                    .foregroundColor(Color.white)
                .background(Color(red: 46/255, green: 204/255, blue: 113/255))
                .cornerRadius(10)
                
            }
            .navigationBarTitle("Add Order")
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView()
    }
}

struct CoffeeCellView: View {
    @Binding var selection: String
    let coffee: CoffeeViewModel
    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            Text(coffee.name)
                .font(.title)
                .padding(.leading, 20)
            Spacer()
            Image(systemName: self.selection == self.coffee.name ? "checkmark" : "").padding()
        }.onTapGesture {
            self.selection = self.coffee.name
        }
    }
}
