//
//  _221TestApp.swift
//  1221Test
//
//  Created by udachi_tomo on 12.08.2024.
//

import SwiftUI

@main
struct _221TestApp: App {
    @StateObject private var viewModel = CardViewModel()
    @State static var previewProduct = Product(
        imageName: "adrenalin",
        name: "FFFF fafafa afafaf",
        price: 99.90,
        oldPrice: "199.90",
        description: "Франция",
        rating: 4.1,
        reviewsCount: 17
    )
    
    var body: some Scene {
        WindowGroup {
            CardView()
//            ListViewCell(product: _221TestApp.$previewProduct)
                .environmentObject(viewModel)
        }
    }
}
