//
//  CustomTabView.swift
//  CustomTabs
//
//  Created by Hyung Seo Han on 2023/07/21.
//

import SwiftUI

struct CustomTabView <Content: View> : View {
    let tabs: [TabItemData]
    @State var hasPhysicalHomeButton = false
    @Binding var selectedIndex: Int
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        VStack {
            TabView(selection: $selectedIndex) {
                ForEach(tabs.indices, id: \.self) { index in
                    content(index)
                        .tag(index)
                }
            }
            TabBottomView(tabbarItems: tabs, hasPhysicalHomeButton: $hasPhysicalHomeButton, selectedIndex: $selectedIndex)
        }
        .onAppear {
            detectPhysicalHomeButton()
        }
    }
    
    private func detectPhysicalHomeButton() {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        guard let window = windowScene?.windows.first else {
            hasPhysicalHomeButton = false
            return
        }
        hasPhysicalHomeButton = window.safeAreaInsets.bottom < 5 // 하단에 safeArea가 있는지 없는지 판단
        print(hasPhysicalHomeButton)
    }
}

//struct CustomTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTabView(tabs: <#[TabItemData]#>, selectedIndex: <#Binding<Int>#>, content: 0 -> HomeView())
//    }
//}
