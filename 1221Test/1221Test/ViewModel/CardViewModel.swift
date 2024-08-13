//
//  CardViewModel.swift
//  1221Test
//
//  Created by udachi_tomo on 12.08.2024.
//

import SwiftUI
import Combine

class CardViewModel: ObservableObject {
    @Published var cards: [Card] = [
        Card(imageName: "adrenalin", name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", price: "99 90", oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false),
        Card(imageName: "adrenalin", name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", price: "99 90", oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false),
        Card(imageName: "adrenalin", name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", price: "99 90", oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false),
             Card(imageName: "adrenalin", name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", price: "99 90", oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: true),
        Card(imageName: "adrenalin", name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", price: "99 90", oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false),
        Card(imageName: "adrenalin", name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", price: "99 90", oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false),
        ]
}
