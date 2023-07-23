//
//  BackButton.swift
//  RecordMe
//
//  Created by Hyung Seo Han on 2023/07/01.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) var dismiss
       var body: some View {
           Button(
               action: {
                   dismiss()
               }) {
                   Image(systemName: "chevron.backward")
                       .aspectRatio(contentMode: .fit)
                       .foregroundColor(Color("SettingFontColor"))
               }
       }
}
