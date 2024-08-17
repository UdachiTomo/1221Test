//
//  GridView.swift
//  1221Test
//
//  Created by udachi_tomo on 16.08.2024.
//

import SwiftUI

struct GridView: View {
    @EnvironmentObject var viewModel: CardViewModel
    @State private var quantity: Double = 0.0
    @State private var unitType: UnitType = .pieces
    let columns: [GridItem] = [
        GridItem(.flexible() ,spacing: 4),
        GridItem(.flexible(), spacing: 4)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach($viewModel.products) { $product in
                    GridViewCell(product: $product)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 5)
                }
            }
        }
    }
}
