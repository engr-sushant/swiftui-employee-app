//
//  MenuItemDetails.swift
//  EmployeeData
//
//  Created by Sushant Kumar on 05/06/22.
//

import SwiftUI

struct MenuItemDetails: View {
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
            Spacer()
        }
        .navigationTitle(Text("Food Details"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MenuItemDetails_Preview: PreviewProvider {
    static var previews: some View {
        MenuItemDetails(item: MenuItem.example)
    }
}
