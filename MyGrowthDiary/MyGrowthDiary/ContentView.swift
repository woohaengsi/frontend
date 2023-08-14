//
//  ContentView.swift
//  MyGrowthDiary
//
//  Created by Hyung Seo Han on 2023/08/14.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    selection == 0 ? Image("HomeColored") : Image("Home")
                }
                .padding(.bottom)
                .tag(0)
            RecordView()
                .tabItem {
                    selection == 1 ? Image("BookColored") : Image("Book")
                }
                .tag(1)
            PlantView()
                .tabItem {
                    selection == 2 ? Image("PlantColored") : Image("Plant")
                }
                
                .tag(2)
            ConfigView()
                .tabItem {
                    selection == 3 ? Image("SmileColored") : Image("Smile")
                }
                .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
