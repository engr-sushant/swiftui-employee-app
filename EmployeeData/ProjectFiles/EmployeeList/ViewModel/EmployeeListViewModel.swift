//
//  EmployeeListViewModel.swift
//  EmployeeData
//
//  Created by Sushant Kumar on 03/06/22.
//

import Foundation
import SwiftUI

protocol DataFetchable {
    func load<T: Decodable>(model: T.Type, fileName: String?) -> T
}

extension DataFetchable {
    func load<T: Decodable>(model: T.Type, fileName: String?) -> T {
        var data = Data()
        guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError("File URL not found.")
        }
        do {
            data = try Data(contentsOf: url)
        } catch {
            fatalError("Content at file not found.")
        }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Not able to convert into model.")
        }
    }
}

struct EmployeeListViewModel: DataFetchable {
    lazy var employees = fetchEmployees()
    private func fetchEmployees() -> [EmployeeData] {
        guard let data = load(model: EmployeeResponse.self, fileName: "employee_data.json").data else {
            return []
        }
        return data
    }
}
