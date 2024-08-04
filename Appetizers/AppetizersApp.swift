//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Tayfun Sener on 31.07.2024.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
