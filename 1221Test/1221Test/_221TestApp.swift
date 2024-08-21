//
//  _221TestApp.swift
//  1221Test
//
//  Created by udachi_tomo on 12.08.2024.
//

import SwiftUI

@main
struct _221TestApp: App {
    @StateObject private var viewModel = ProductViewModel()
    var body: some Scene {
        WindowGroup {
            CardView(viewModel: viewModel)
                .environmentObject(viewModel)
        }
    }
}
