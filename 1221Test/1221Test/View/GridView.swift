//
//  GridView.swift
//  1221Test
//
//  Created by udachi_tomo on 16.08.2024.
//

import SwiftUI

struct GridView: View {
    @EnvironmentObject var viewModel: ProductViewModel
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 4),
        GridItem(.flexible(), spacing: 4)
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, alignment: .center) {
                ForEach($viewModel.products) { $product in
                    GridViewCell(product: $product)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 6)
                }
            }
        }
    }
}
