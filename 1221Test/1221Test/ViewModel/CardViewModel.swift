//
//  CardViewModel.swift
//  1221Test
//
//  Created by udachi_tomo on 12.08.2024.
//

import SwiftUI
import Combine

class CardViewModel: ObservableObject {
    @Published var products: [Product] = [
        Product(imageName: "adrenalin", badgeType: .new, name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", price: 99.90, oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false),
        Product(imageName: "apple", name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", price: 99.90, oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false),
        Product(imageName: "barbecue",badgeType: .sale, name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", price: 99.90, oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false),
        Product(imageName: "bread", name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", price: 99.90, oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false),
        Product(imageName: "lidenTree", name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", price: 99.90, oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false),
        Product(imageName: "steak", name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", price: 99.90, oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false),
        Product(imageName: "cucumbers", name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", price: 99.90, oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false),
        Product(imageName: "cabbage", name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", price: 99.90, oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false)
    ]
    
    func addToCart(product: Product) {
            guard let index = products.firstIndex(where: { $0.id == product.id }) else { return }
            products[index].isInCart = true
            products[index].quantity = products[index].unitType == .kilograms ? 0.1 : 1
        }

        func updateQuantity(product: Product, quantity: Double, unitType: UnitType) {
            guard let index = products.firstIndex(where: { $0.id == product.id }) else { return }
            products[index].quantity = quantity
            products[index].unitType = unitType
        }

        func removeFromCart(product: Product) {
            guard let index = products.firstIndex(where: { $0.id == product.id }) else { return }
            products[index].isInCart = false
            products[index].quantity = 0.0
        }
}
