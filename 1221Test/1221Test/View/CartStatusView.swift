//
//  CartStatusView.swift
//  1221Test
//
//  Created by udachi_tomo on 20.08.2024.
//

import SwiftUI

struct CartStatusView: View {
    @EnvironmentObject var cartViewModel: CardViewModel
    var body: some View {
        HStack {
            Text("В корзине: \(cartViewModel.products.filter { $0.isInCart }.count) товаров")
                .font(.headline)
                .padding()
            
            Spacer()
        }
        .background(Color.yellow.opacity(0.3))
    }
}

#Preview {
    CartStatusView()
}
