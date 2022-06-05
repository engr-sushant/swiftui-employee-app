//
//  EmployeeRow.swift
//  EmployeeData
//
//  Created by Sushant Kumar on 03/06/22.
//

import SwiftUI

struct EmployeeRow: View {
    var employee: EmployeeData
    var body: some View {
        HStack {
            CircularImage(imageName: employee.image, size: 70)
                .padding()
            Text(employee.preferredFullName)
            Spacer()
        }
        .frame(height: 70)
        .padding()
    }
}

struct EmployeeRow_Preview: PreviewProvider {
    static var previews: some View {
        EmployeeRow(employee: EmployeeData(id: 1,
                                           userId: "1",
                                           jobTitleName: "John",
                                           firstName: "John",
                                           lastName: "Sting",
                                           preferredFullName: "John Sting",
                                           region: "",
                                           phoneNumber: "",
                                           emailAddress: "",
                                           image: "image-1"))
    }
}
