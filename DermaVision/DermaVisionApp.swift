//
//  DermaVisionApp.swift
//  DermaVision
//
//  Created by Riya Jain on 2/3/22.
//

import SwiftUI
import Firebase

@main
struct DermaVisionApp: App {
    @StateObject private var locationManager = LocationManager()

    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationManager)

        }
    }
}
