//
//  CircularImage.swift
//  EmployeeData
//
//  Created by Sushant Kumar on 03/06/22.
//

import SwiftUI

struct CircularImage: View {
    var imageName: String
    var size: CGFloat
    var body: some View {
        HStack {
            Image(imageName, bundle: .main)
                .resizable()
                .frame(width: size, height: size, alignment: .center)
                .clipShape(Circle())
                .shadow(radius: 20.0)
                .overlay(Circle().stroke(Color.gray, lineWidth: 5))
        }
    }
}

struct CircularImage_Preview: PreviewProvider {
    static var previews: some View {
        CircularImage(imageName: "image-1", size: 100)
    }
}
