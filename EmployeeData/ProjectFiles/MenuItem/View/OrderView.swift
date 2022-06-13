//
//  OrderView.swift
//  EmployeeData
//
//  Created by Sushant Kumar on 12/06/22.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    func deleteItem(at index: IndexSet) {
        order.items.remove(atOffsets: index)
    }

    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                    .onDelete(perform: deleteItem(at:))
                }
                
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Place Order")
                    }
                    .disabled(order.items.isEmpty)
                }
            }
            .navigationTitle(Text("My Order"))
            .listStyle(.inset)
            .toolbar {
                EditButton()
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
