//
//  OnboardingPageEndView.swift
//  MyGrowthDiary
//
//  Created by Hyung Seo Han on 2023/07/11.
//

import SwiftUI

struct OnboardingPageEndView: View {
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

struct OnboardingPageEndView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageEndView(imageName: "Onboarding", content: "같은 질문에 다시 답변을 하면서 이전과 생각이 달라진 점이 있는지 비교해보세요. 성장하고 있는 당신을 발견할 수 있을거에요!")
    }
}
