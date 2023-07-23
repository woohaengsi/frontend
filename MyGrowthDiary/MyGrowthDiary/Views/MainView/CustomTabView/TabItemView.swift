//
//  TabItemView.swift
//  CustomTabs
//
//  Created by Hyung Seo Han on 2023/07/21.
//
//  Note : This view is for one element in Tabbar
//

import SwiftUI

struct TabItemView: View {
    let data: TabItemData
    let isSelected: Bool
    
    var body: some View {
        Image(isSelected ? data.selectedImage : data.image)
            .resizable()
            .frame(width: 40, height: 40)
    }
}

struct TabItemView_Previews: PreviewProvider {
    static var previews: some View {
        TabItemView(data: TabItemData(image: "BookOpened", selectedImage: "BookOpenedColored"), isSelected: false)
    }
}

