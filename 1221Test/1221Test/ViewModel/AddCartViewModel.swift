//
//  AddCartViewModel.swift
//  1221Test
//
//  Created by udachi_tomo on 14.08.2024.
//

import SwiftUI
import Combine

class AddCartViewModel: ObservableObject {
    @Published var isInCart: Bool = false
    @Published var unitType: UnitType = .pieces
    @Published var quantity: Double = 0.0
    @Published var showUnitPicker: Bool = false
    
    func addToCart() {
        isInCart = true
        showUnitPicker = true
        quantity = unitType == .kilograms ? 0.5 : 1
    }
    
    func removeFromCart() {
        isInCart = false
        quantity = 0.0
        showUnitPicker = false
    }
}
