//
//  EaseeDemoApp.swift
//  EaseeDemo
//
//  Created by Marco Wenzel on 14.04.22.
//

import SwiftUI

@main
struct EaseeDemoApp: App {
    @StateObject var model = Model.preview
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
