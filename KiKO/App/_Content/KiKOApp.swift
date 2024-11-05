//
//  KiKOApp.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 04.11.24.
//

import SwiftUI
import SwiftData

@main
struct KiKOApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [MealCategory.self])
    }
}
