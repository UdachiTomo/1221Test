//
//  CardModel.swift
//  1221Test
//
//  Created by udachi_tomo on 12.08.2024.
//

import Foundation

struct Card: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let price: String
    let oldPrice: String
    let description: String
    let rating: Double
    let reviewsCount: Int
    var unitType: UnitType = .pieces
    var isInCart: Bool = false
}

