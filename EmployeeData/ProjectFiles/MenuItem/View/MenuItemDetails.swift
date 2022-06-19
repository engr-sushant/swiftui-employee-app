//
//  MenuItemDetails.swift
//  EmployeeData
//
//  Created by Sushant Kumar on 05/06/22.
//

import SwiftUI

struct MenuItemDetails: View {
    @EnvironmentObject var order: Order
    var item: MenuItem
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                    .padding(4)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding(4)
            
            Button("Add This") {
                order.add(item: item)
            }
            .font(.headline)
            .padding()
            Spacer()
        }
        .navigationTitle(Text("Food Details"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MenuItemDetails_Preview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MenuItemDetails(item: MenuItem.example)
                .environmentObject(Order())
        }
    }
}
