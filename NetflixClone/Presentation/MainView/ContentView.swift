//
//  ContentView.swift
//  NetflixClone
//
//  Created by Raden Dimas on 03/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showPreviewFullScreen = false
    @State private var previewStartingIndex: Int = 0
    
    @State private var previewCurrentPos: CGFloat = 1000
    @State private var previewNewPos: CGFloat = 1000
    
    @State private var previewHorizontalDragActive: Bool = false
    
    let screen = UIScreen.main.bounds
    
    init() {
//        UITabBar.appearance().isTranslucent = false
//        UITabBar.appearance().barTintColor = UIColor.black

        
        let standardAppearance = UITabBarAppearance()
//           standardAppearance.configureWithDefaultBackground()
        standardAppearance.backgroundColor = .black
           UITabBar.appearance().standardAppearance = standardAppearance

           let scrollEdgeAppearance = UITabBarAppearance()
//        scrollEdgeAppearance.configureWithTransparentBackground()
        scrollEdgeAppearance.backgroundColor = .black
           UITabBar.appearance().scrollEdgeAppearance = scrollEdgeAppearance
        
    }
    
    var body: some View {
        TabView {
            HomeView(
                showPreviewFullscreen: $showPreviewFullScreen,
                previewStartingIndex: $previewStartingIndex)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0)
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }.tag(1)
            
            ComingSoon()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Coming Soon")
                }.tag(2)
            
            DownloadView()
                .tabItem {
                    Image(systemName: "arrow.down.to.line.alt")
                    Text("Downloads")
                }.tag(3)
        }
        .accentColor(.white)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
