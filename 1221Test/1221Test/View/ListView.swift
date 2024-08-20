//
//  NewListView.swift
//  1221Test
//
//  Created by udachi_tomo on 16.08.2024.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var viewModel: CardViewModel
    var body: some View {
        List {
            ForEach($viewModel.products) { $product in
                ListViewCell(product: $product)
                    
            }
            .buttonStyle(PlainButtonStyle())
            .scrollIndicators(.hidden)
        }
    }
    
}



