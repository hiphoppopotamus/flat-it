//
//  FlatItApp.swift
//  FlatIt
//
//  Created by Euan Widjaja on 20/01/23.
//

import SwiftUI

@main
struct FlatItApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, FlatmatesProvider.shared.viewContext)
        }
    }
}
