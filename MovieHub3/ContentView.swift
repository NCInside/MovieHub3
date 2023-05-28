//
//  ContentView.swift
//  MovieHub3
//
//  Created by MacBook Pro on 25/05/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var selection: Tab = .movie
    @AppStorage("shouldonboard") var shouldonboard: Bool = true
    //    @State var shouldonboard: Bool = true
    
    enum Tab {
        case movie
        case theater
        case profile
    }
    
    init() {
        let standardAppearance = UITabBarAppearance()
        standardAppearance.backgroundColor = UIColor(red: 217/255.0, green: 37/255.0, blue: 29/255.0, alpha: 1)
        standardAppearance.stackedLayoutAppearance.normal.iconColor = .white
        standardAppearance.inlineLayoutAppearance.normal.iconColor = .white
        standardAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        standardAppearance.inlineLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        UITabBar.appearance().standardAppearance = standardAppearance
        UITabBar.appearance().scrollEdgeAppearance = standardAppearance
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        let segmentedAppearance = UISegmentedControl.appearance()
        segmentedAppearance.backgroundColor = .red.withAlphaComponent(0.15)
        segmentedAppearance.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        segmentedAppearance.selectedSegmentTintColor = .red
        segmentedAppearance.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segmentedAppearance.setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
    }

    var body: some View {
        TabView(selection: $selection) {
            MovieList()
                .tabItem {
                    Label("Movies", systemImage: "film")
                }
                .tag(Tab.movie)
            MovieList()
                .tabItem {
                    Label("Theaters", systemImage: "popcorn")
                }
                .tag(Tab.theater)
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(Tab.profile)
        }
        .accentColor(Color.black)
        .fullScreenCover(isPresented: $shouldonboard, content: {
            onBoardingView(shouldonboard: $shouldonboard)
        })
    }
}

struct onBoardingView: View{
    @Binding var shouldonboard:Bool

    var body: some View{
        TabView{
            OnboardingView1()
            OnboardingView2()
            OnboardingView3(shouldonboard: $shouldonboard)
        }.tabViewStyle(PageTabViewStyle()).ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
