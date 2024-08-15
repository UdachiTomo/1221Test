//
//  CardModel.swift
//  1221Test
//
//  Created by udachi_tomo on 12.08.2024.
//

import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    let imageName: String
    var badgeType: BadgeType?
    let name: String
    let price: String
    let oldPrice: String
    let description: String
    let rating: Double
    let reviewsCount: Int
    var unitType: UnitType = .pieces
    var isInCart: Bool = false
    var quantity: Double = 0.0
}

enum BadgeType {
    case sale
    case new
    case cardPrice
    
    var text: String {
        switch self {
        case .sale:
            return "Удар по ценам"
        case .new:
            return "Новинки"
        case .cardPrice:
            return "Цена по карте"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .sale:
            return .pink
        case .new:
            return .purple
        case .cardPrice:
            return .green
        }
    }
}

