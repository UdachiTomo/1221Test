//
//  CardModel.swift
//  1221Test
//
//  Created by udachi_tomo on 12.08.2024.
//

import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let imageName: String
    var badgeType: BadgeType?
    let name: String
    var price: Double
    let oldPrice: String
    let description: String
    let rating: Double
    let reviewsCount: Int
    var unitType: UnitType = .pieces
    var isInCart: Bool = false
    var quantity: Double = 0.0
    
    var formattedPrice: String {
            return String(format: "%.2f", price).replacingOccurrences(of: ".", with: " ")
        }
    
    var formattedPriceWithSubText: (String, String) {
            let components = formattedPrice.split(separator: " ")
            if components.count == 2 {
                return (String(components[0]), String(components[1]))
            }
            return (formattedPrice, "")
        }
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

enum UnitType {
    case pieces
    case kilograms
}

