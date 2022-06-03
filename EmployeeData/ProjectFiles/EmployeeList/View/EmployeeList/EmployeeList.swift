//
//  EmployeeList.swift
//  EmployeeData
//
//  Created by Sushant Kumar on 03/06/22.
//

import SwiftUI

struct EmployeeList {
    private lazy var viewModel = EmployeeListViewModel()
    private var employees = [EmployeeData]()
    init() {
        employees = viewModel.employees
    }
}

extension EmployeeList: View {
    var body: some View {
        NavigationView {
            List(employees) { employee in
                NavigationLink(destination: EmployeeDetails(employee: employee)) {
                    EmployeeRow(employee: employee)
                }
            }
            .navigationTitle(Text("Employee List"))
        }
    }
}

struct EmployeeList_Preview: PreviewProvider {
    static var previews: some View {
        EmployeeList()
    }
}
