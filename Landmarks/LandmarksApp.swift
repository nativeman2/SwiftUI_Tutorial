//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Ayodeji Onipe on 2021-07-27.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
