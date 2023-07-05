//
//  OperationData.swift
//  MyGrowthDiary
//
//  Created by Hyung Seo Han on 2023/07/06.
//

import SwiftUI

class OperationData: ObservableObject {
    @Published var currentView: CurrentViewStatus
    
    init() {
        //로그인 키가 있으면서 로그인 상태일 때
        if (UserDefaults.standard.bool(forKey: "isLoggedIn")) {
            self.currentView = .home
        }
        //key값이 없거나, 또는 false 일 때
        else {
            self.currentView = .signIn
        }
    }
    
    func checkLoginStatus() {
        if (UserDefaults.standard.bool(forKey: "isLoggedIn")) {
            self.currentView = .home
        } else {
            self.currentView = .signIn
        }
    }
}
