//
//  OperationData.swift
//  MyGrowthDiary
//
//  Created by Hyung Seo Han on 2023/07/06.
//

import SwiftUI
import AuthenticationServices

class OperationData: ObservableObject {
    @Published var currentView: CurrentViewStatus
    
    init() {
        self.currentView = .home
//        if (UserDefaults.standard.bool(forKey: "isLoggedIn")) {
//            if (UserDefaults.standard.bool(forKey: "isOnboarded")) {
//                self.currentView = .home
//            }
//            else {
//                self.currentView = .onBoarding
//            }
//        } else {
//            self.currentView = .signIn
//        }
    }
    
    func checkLoginStatus() {
        if (UserDefaults.standard.bool(forKey: "isLoggedIn")) {
            if (UserDefaults.standard.bool(forKey: "isOnboarded")) {
                self.currentView = .home
            }
            else {
                self.currentView = .onBoarding
            }
        } else {
            self.currentView = .signIn
        }
    }
}


