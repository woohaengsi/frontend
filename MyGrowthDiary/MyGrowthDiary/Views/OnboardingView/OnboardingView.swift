//
//  OnboardingView.swift
//  MyGrowthDiary
//
//  Created by Hyung Seo Han on 2023/07/06.
//

import SwiftUI

struct OnboardingView: View {
    /*
     Onboarding 다 볼때까진 로그인 못함
     */
    var body: some View {
        TabView {
            OnboardingPageView(
                imageName: "Onboarding",
                content: "하루 한 개의 질문에 답변을 기록해 보세요. 매일 새로운 질문이 당신을 기다리고 있습니다."
            )
            
            OnboardingPageView(
                imageName: "OnboardingMid",
                content: "30개의 질문에 답변을 완료할 때 마다 1개의 꽃을 받을 수 있어요. 꽃을 받으면 이전에 작성했던 질문들에 다시 답변할지 새로운 질문들을 받을지 선택할 수 있답니다!"
            )
            
            OnboardingPageEndView(
                imageName: "OnboardingEnd",
                content: "같은 질문에 다시 답변을 하면서 이전과 생각이 달라진 점이 있는지 비교해 보세요. 성장하고 있는 당신을 발견할 수 있을 거예요!"
            )
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
