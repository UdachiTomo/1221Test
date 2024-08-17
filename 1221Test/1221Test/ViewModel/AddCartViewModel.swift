//
//  AddCartViewModel.swift
//  1221Test
//
//  Created by udachi_tomo on 14.08.2024.
//

import SwiftUI
import Combine

class AddCartViewModel: ObservableObject {
    @Published var product: Product
    @Published var showUnitPicker: Bool = false
    
    init(product: Product) {
        self.product = product
    }
    
    func toggleCart() {
            product.isInCart.toggle()
            if product.isInCart {
                showUnitPicker = true
                product.quantity = product.unitType == .kilograms ? 0.5 : 1
            } else {
                showUnitPicker = false
                product.quantity = 0
            }
        }
        
        func increaseQuantity() {
            if product.unitType == .kilograms {
                product.quantity += 0.5
            } else {
                product.quantity += 1
            }
        }
        
        func decreaseQuantity() {
            if product.unitType == .kilograms && product.quantity > 0.5 {
                product.quantity -= 0.5
            } else if product.unitType == .pieces && product.quantity > 1 {
                product.quantity -= 1
            } else {
                product.isInCart = false
                product.quantity = 0
            }
        }
}
