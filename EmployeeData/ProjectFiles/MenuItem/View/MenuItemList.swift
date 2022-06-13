//
//  MenuItemList.swift
//  EmployeeData
//
//  Created by Sushant Kumar on 05/06/22.
//

import SwiftUI

struct MenuItemViewModel: DataFetchable {
    lazy var menuItems = fetchMenuItem()
    private func fetchMenuItem() -> [MenuSection] {
        load(model: [MenuSection].self, fileName: "menu_items.json")
    }
}

struct MenuItemList {
    private lazy var viewModel = MenuItemViewModel()
    private var menuItems = [MenuSection]()
    init() {
        menuItems = viewModel.menuItems
    }

}

extension MenuItemList: View {
    var body: some View {
        NavigationView {
            List(menuItems) { section in
                Section(header: Text(section.name)) {
                    ForEach(section.items) { item in
                        NavigationLink(destination: MenuItemDetails(item: item)) {
                            MenuItemRow(sectionItem: item)
                        }
                    }
                }
            }
            .navigationTitle(Text("Menu"))
            .listStyle(GroupedListStyle())
        }
    }
}

struct MenuItemList_Preview: PreviewProvider {
    static var previews: some View {
        MenuItemList()
    }
}
