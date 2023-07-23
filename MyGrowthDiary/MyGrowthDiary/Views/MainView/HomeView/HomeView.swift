//
//  HomeView.swift
//  RecordMe
//
//  Created by Hyung Seo Han on 2023/06/29.
//

import SwiftUI
import MessageUI

struct HomeView: View {
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                VStack (alignment: .center) {
                    Image("HomeviewImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width/3)
                        .padding()
                        
                    HomeBookOpenedView()
                        .padding(EdgeInsets(top: 0, leading: 45, bottom: 0, trailing: 40))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
