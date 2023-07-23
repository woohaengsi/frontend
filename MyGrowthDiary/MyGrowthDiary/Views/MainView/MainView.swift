//
//  HomeView.swift
//  MyGrowthDiary
//
//  Created by Hyung Seo Han on 2023/07/06.
//

import SwiftUI

struct MainView: View {
    @State var selectedIndex: Int = 0
    
    var body: some View {
        NavigationStack {
            CustomTabView(tabs: TabType.allCases.map({$0.tabItem}), selectedIndex: $selectedIndex) { index in
                let type = TabType(rawValue: index) ?? .home
                getTabView(type: type)
            }
        }
    }
    
    @ViewBuilder
    func getTabView(type: TabType) -> some View {
        switch type {
        case .home:
            HomeView()
        case .recordLog:
            TestTwo()
        case .flower:
            TestThree()
        case .setting:
            TestFour()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
