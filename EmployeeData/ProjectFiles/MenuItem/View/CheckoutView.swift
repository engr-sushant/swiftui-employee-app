//
//  CheckoutView.swift
//  EmployeeData
//
//  Created by Sushant Kumar on 12/06/22.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    @State private var loyaltyAccount = false
    @State private var loyaltyNumber = ""
    @State private var tip = 15
    @State private var showAlert = false
    
    private let paymentTypes = ["Cash", "Credit Card", "Loyalty Points"]
    private let tips = [10, 15, 20, 25, 0]
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tip)
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Create loyalty Account", isOn: $loyaltyAccount.animation())
                if loyaltyAccount {
                    TextField("Enter your loyalty number.", text: $loyaltyNumber)
                }
            }
            
            Section("Add a tip?", content: {
                Picker("Discount:", selection: $tip) {
                    ForEach(tips, id: \.self) { tip in
                        Text("\(tip)%")
                    }
                }
                .pickerStyle(.segmented)
            })
            
            Section(header: Text("Total: \(totalPrice)")
                        .font(.title)) {
                Button("Order Now") {
                    showAlert.toggle()
                }
            }
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Order Successful"),
                  message: Text("Your total was \(totalPrice) - Thank you!"),
                  dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
