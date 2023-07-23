//
//  CustomButton.swift
//  RecordMe
//
//  Created by Hyung Seo Han on 2023/07/02.
//

import SwiftUI

struct CustomButton: View {
    let name: String
    let color: Color?
    var body: some View {
        Text("\(name)")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.black)
            .padding(EdgeInsets(top: 10, leading: 18, bottom: 10, trailing: 18))
            .background(color != nil ? color : Color("SettingBackground"))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
            )
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(name: "제출하기", color: .blue)
    }
}
