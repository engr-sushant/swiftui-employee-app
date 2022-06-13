//
//  MainView.swift
//  EmployeeData
//
//  Created by Sushant Kumar on 12/06/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MenuItemList()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            OrderView()
                .tabItem {
                    Label("My Order", systemImage: "square.and.pencil")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Order())
    }
}
