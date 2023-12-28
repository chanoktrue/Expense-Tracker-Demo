//
//  ContentView.swift
//  Expense Tracker Demo
//
//  Created by Thongchai Subsaidee on 28/12/23.
//

import SwiftUI

struct ContentView: View {
    
    // Visibility Status
    @AppStorage("isFirstTime") private var isFirstTimer: Bool = true
    
    //Active Tab
    @State private var activeTab: Tab = .recents
    
    var body: some View {
       
        TabView(selection: $activeTab) {
            Text("Recents")
                .tag(Tab.recents)
                .tabItem { Tab.recents.tabContent }
            
            Text("Seach")
                .tag(Tab.search)
                .tabItem { Tab.search.tabContent }
            
            Text("Chart")
                .tag(Tab.charts)
                .tabItem { Tab.charts.tabContent }
            
            Text("Settings")
                .tag(Tab.settings)
                .tabItem { Tab.settings.tabContent }
        }
        .tint(appTint)
        .sheet(isPresented: $isFirstTimer, content: {
            IntroScreen()
                .interactiveDismissDisabled()
        })
        
    }
}

#Preview {
    ContentView()
}
