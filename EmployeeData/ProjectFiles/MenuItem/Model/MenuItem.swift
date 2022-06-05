//
//  MenuItem.swift
//  EmployeeData
//
//  Created by Sushant Kumar on 05/06/22.
//

import SwiftUI

struct MenuSection: Codable, Identifiable {
    var id: String
    var name: String
    var items: [MenuItem]
#if DEBUG
    static let example = MenuSection.init(id: "EDCD038C-036F-4C40-826F-61C88CD84DDD",
                                          name: "Food item",
                                          items: [MenuItem(id: "1",
                                                           name: "Maple French Toast",
                                                           photoCredit: "Joseph Gonzalez",
                                                           price: 6,
                                                           restrictions: ["G", "V"],
                                                           description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you.")])
    
#endif
}

struct MenuItem: Codable, Equatable, Identifiable {
    var id: String
    var name: String
    var photoCredit: String
    var price: Int
    var restrictions: [String]
    var description: String
    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }
    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }
#if DEBUG
    static let example = MenuItem(id: "1",
                                  name: "Maple French Toast",
                                  photoCredit: "Joseph Gonzalez",
                                  price: 6,
                                  restrictions: ["G", "V"],
                                  description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you.")
#endif
}
