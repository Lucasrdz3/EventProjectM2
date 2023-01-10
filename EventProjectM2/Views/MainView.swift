//
//  MainView.swift
//  EFREI-TP2-SwiftUI
//
//  Created by user232282 on 1/8/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView(viewModel: ViewModel(),title: "Home")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ContentView(viewModel: ViewModel(),title: "Full schedule")
                .tabItem {
                    Label("Full schedule", systemImage: "calendar")
                }
        }
        
    }
    
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
}
