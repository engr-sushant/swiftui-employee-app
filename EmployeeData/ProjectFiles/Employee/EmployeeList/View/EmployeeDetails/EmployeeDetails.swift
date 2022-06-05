//
//  EmployeeDetails.swift
//  EmployeeData
//
//  Created by Sushant Kumar on 03/06/22.
//

import SwiftUI

struct EmployeeDetails: View {
    var employee: EmployeeData
    var body: some View {
        VStack {
            VStack {
                CircularImage(imageName: employee.image, size: 170)
                    .padding()
                Text(employee.preferredFullName)
                    .padding()
                    .font(.title2)
                SeparatorLine()
                
            }
            .padding()
            .frame(minWidth: 170, maxWidth: .infinity)
            .frame(height: 270)
            
            EmployeeRowDetails(title: "Job Title", value: employee.jobTitleName)
            EmployeeRowDetails(title: "Email Address", value: employee.emailAddress)
            EmployeeRowDetails(title: "Phone Number", value: employee.phoneNumber)
            EmployeeRowDetails(title: "Region", value: employee.region)
        }
        .navigationTitle(Text(employee.firstName))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EmployeeRowDetails: View {
    var title: String
    var value: String
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .padding()
                    .font(.system(size: 17, weight: .bold))
                Text(value)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .multilineTextAlignment(.trailing)
                Spacer()
            }
            SeparatorLine()
                .scenePadding(.horizontal)
        }
    }
}

struct SeparatorLine: View {
    var body: some View {
        Rectangle()
            .frame(height: 1.0)
            .foregroundColor(.gray)
    }
}

struct EmployeeDetails_Preview: PreviewProvider {
    static var previews: some View {
        EmployeeDetails(employee: EmployeeData(id: 1,
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
