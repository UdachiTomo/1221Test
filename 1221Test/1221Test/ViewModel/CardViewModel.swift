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
        Product(imageName: "bread", name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", price: 99.90, oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: true),
        Product(imageName: "lidenTree", name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", price: 99.90, oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false),
        Product(imageName: "steak", name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", price: 99.90, oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false),
        Product(imageName: "cucumbers", name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", price: 99.90, oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false),
        Product(imageName: "cabbage", name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", price: 99.90, oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false),
        
    ]
    
    func toggleCart(for product: Product) {
            if let index = products.firstIndex(where: { $0.id == product.id }) {
                products[index].isInCart.toggle()
                if products[index].isInCart {
                    products[index].quantity = products[index].unitType == .kilograms ? 0.5 : 1
                } else {
                    products[index].quantity = 0
                }
            }
        }
        
        func updateQuantity(for product: Product, by amount: Double) {
            if let index = products.firstIndex(where: { $0.id == product.id }) {
                let newQuantity = products[index].quantity + amount
                products[index].quantity = max(0, newQuantity)
                if products[index].quantity == 0 {
                    products[index].isInCart = false
                }
            }
        }
}
