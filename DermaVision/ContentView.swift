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
            Logout()
                .tabItem{
                    Image(systemName: "person.crop.circle.fill")
                    Text("Login")
                }
            HomePageView()
                .tabItem{
                    Image(systemName: "sun.max")
                    Text("UV Forecast")
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
