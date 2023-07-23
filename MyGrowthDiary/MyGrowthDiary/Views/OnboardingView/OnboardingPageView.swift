//
//  OnboardingPageView.swift
//  MyGrowthDiary
//
//  Created by Hyung Seo Han on 2023/07/11.
//

import SwiftUI

struct OnboardingPageView: View {
    let imageName: String
    let content: String
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .padding()
            Text(content)
                .padding(EdgeInsets(top: 0, leading: 35, bottom: 0, trailing: 35))
                .font(.system(size: 18.0))
            
        }
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(imageName: "Onboarding", content: "하루 한 개의 질문에 답변을 기록해 보세요. 매일 새로운 질문이 당신을 기다리고 있습니다.")
    }
}
