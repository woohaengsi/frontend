//
//  TabType.swift
//  MyGrowthDiary
//
//  Created by Hyung Seo Han on 2023/07/24.
//

import Foundation

enum TabType: Int, CaseIterable {
    case home = 0
    case recordLog
    case flower
    case setting

    var tabItem: TabItemData {
        switch self {
        case .home:
            return TabItemData(image: "Home", selectedImage: "HomeColored")
        case .recordLog:
            return TabItemData(image: "BookOpened", selectedImage: "BookOpenedColored")
        case .flower:
            return TabItemData(image: "Plant", selectedImage: "PlantColored")
        case .setting:
            return TabItemData(image: "Smile", selectedImage: "SmileColored")
        }
    }
}
