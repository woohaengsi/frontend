//
//  ContentView.swift
//  MyGrowthDiary
//
//  Created by Hyung Seo Han on 2023/07/06.
//

import SwiftUI

struct ContentView: View {
    //로그인 상태를 observe하는 객체
    @EnvironmentObject var opData: OperationData
    
    var body: some View {
        switch(opData.currentView) {
        case .home:
            MainView()
                .environmentObject(opData)
        case .onBoarding:
            OnboardingView()
                .environmentObject(opData)
        case .signIn:
            LoginView()
                .environmentObject(opData)
        //여기에 그 Onboarding View 볼 수 있는ㅇ로직 하나 더 추가해야함
        //case .onBoarding() 이런식으로
        //opData에서 isLoggedIn 수정
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(OperationData())
    }
}
