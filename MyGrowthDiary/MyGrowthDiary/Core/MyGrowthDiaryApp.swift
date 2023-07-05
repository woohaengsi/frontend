//
//  MyGrowthDiaryApp.swift
//  MyGrowthDiary
//
//  Created by Hyung Seo Han on 2023/07/06.
//

import SwiftUI

@main
struct MyGrowthDiaryApp: App {
    private var opData = OperationData()
    
    init() {
        Thread.sleep(forTimeInterval: 1.0)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(opData)
        }
    }
}
