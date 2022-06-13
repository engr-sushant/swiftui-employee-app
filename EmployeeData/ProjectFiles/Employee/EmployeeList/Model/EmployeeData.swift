//
//  EmployeeData.swift
//  EmployeeData
//
//  Created by Sushant Kumar on 03/06/22.
//

import SwiftUI

struct EmployeeResponse: Codable {
    var data: [EmployeeData]?
}

struct EmployeeData: Codable, Identifiable {
    var id: Int
    var userId: String
    var jobTitleName: String
    var firstName: String
    var lastName: String
    var preferredFullName: String
    var region: String
    var phoneNumber: String
    var emailAddress: String
    var image: String
}
