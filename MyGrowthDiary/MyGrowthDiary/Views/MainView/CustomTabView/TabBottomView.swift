//
//  TabBottomView.swift
//  CustomTabs
//
//  Created by Hyung Seo Han on 2023/07/21.
//

import SwiftUI
import UIKit

struct TabBottomView: View {
    
    let tabbarItems: [TabItemData] // elements of Tab bar
    @Binding var hasPhysicalHomeButton: Bool
    @Binding var selectedIndex: Int
    var body: some View {
        VStack {
            //탭바 상단의 선 긋기
            Divider()
                .frame(minHeight: 3)
                .overlay(Color.black)
                .padding(EdgeInsets(top: -8, leading: 0, bottom: 5, trailing: 0))
            HStack {
                Spacer()
                ForEach(0..<tabbarItems.count, id : \.self) { index in
                    let item = tabbarItems[index]
                    Button {
                        self.selectedIndex = index
                    } label: {
                        let isSelected = selectedIndex == index
                        TabItemView(data: item, isSelected: isSelected)
                    }
                    Spacer()
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: hasPhysicalHomeButton == true ? 20 : 0, trailing: 0))
        .onAppear {
            print(hasPhysicalHomeButton)
        }
        
    }
    
}

struct TabBottomView_Previews: PreviewProvider {
    static var previews: some View {
        TabBottomView(tabbarItems: [TabItemData(image: "Home", selectedImage: "HomeColored"),
                                    TabItemData(image: "BookOpened", selectedImage: "BookOpenedColored"),
                                    TabItemData(image: "Plant", selectedImage: "PlantColored"),
                                    TabItemData(image: "Smile", selectedImage: "SmileColored")
                                   ], hasPhysicalHomeButton: .constant(true),
                      selectedIndex: .constant(0))
    }
}
