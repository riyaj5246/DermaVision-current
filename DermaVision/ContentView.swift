//
//  ContentView.swift
//  DermaVision
//
//  Created by Riya Jain on 2/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomePageView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            RiskDetectionView()
                .tabItem{
                    Image(systemName: "camera")
                    Text("Risk Detection")
                }
            CalendarView()
                .tabItem{
                    Image(systemName: "calendar")
                    Text("Daily Tracker")
                }
       }
        .colorScheme(.light)
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
