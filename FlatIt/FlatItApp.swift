//
//  FlatItApp.swift
//  FlatIt
//
//  Created by Euan Widjaja on 20/01/23.
//

import SwiftUI

@main
struct FlatItApp: App {
    @StateObject private var flatmatesData = FlatmatesData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(flatmatesData)
        }
    }
}
