//
//  MenuItemRow.swift
//  EmployeeData
//
//  Created by Sushant Kumar on 05/06/22.
//

import SwiftUI

struct MenuItemRow: View {
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    var sectionItem: MenuItem
    var body: some View {
        HStack {
            Image(sectionItem.thumbnailImage)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: 2))
                .frame(width: 40, height: 40, alignment: .center)
            VStack {
                Text(sectionItem.mainImage)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                Text("$ \(sectionItem.price)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 15, weight: .light))
            }
            ForEach(sectionItem.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(5)
                    .background(colors[restriction])
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            Spacer()
        }
        .frame(height: 50)
    }
}

struct MenuItemRow_Preview: PreviewProvider {
    static var previews: some View {
        MenuItemRow(sectionItem: MenuItem.example)
    }
}
