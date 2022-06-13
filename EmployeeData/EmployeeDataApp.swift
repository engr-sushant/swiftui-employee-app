//
//  EmployeeDataApp.swift
//  EmployeeData
//
//  Created by Sushant Kumar on 03/06/22.
//

import SwiftUI

@main
struct EmployeeDataApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(Order())
        }
    }
}
