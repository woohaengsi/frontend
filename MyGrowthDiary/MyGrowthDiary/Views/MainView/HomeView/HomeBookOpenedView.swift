//
//  HomeBookOpenedView.swift
//  RecordMe
//
//  Created by Hyung Seo Han on 2023/07/02.
//

import SwiftUI

struct HomeBookOpenedView: View {
    
    @State var todayQuestion: String = "오늘 하루 가장 행복했던 순간은 언제였나요?"
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Image("HomeCardImage")
                    .resizable()
                    .scaledToFit()
                VStack {
                    Image("HomeBookOpened")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width / 5 * 3)
                        .padding(EdgeInsets(top: (geometry.size.height / 15), leading: 0, bottom: geometry.size.height/15, trailing: (geometry.size.width / 5 * 3) / 25 ))
                    //여기에 질문이 들어와야함
                    Text("\(todayQuestion)")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .frame(maxWidth: geometry.size.width / 5 * 3)
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: geometry.size.height/10, trailing: (geometry.size.width / 5 * 3) / 25))
                    //답변하기 버튼
                    NavigationLink(destination: Navone(), label: {
                        CustomButton(name: "답변하기", color: nil)    
                    })
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 12))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

struct HomeBookOpenedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBookOpenedView()
    }
}
