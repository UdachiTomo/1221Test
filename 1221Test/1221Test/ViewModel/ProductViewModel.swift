//
//  CardViewModel.swift
//  1221Test
//
//  Created by udachi_tomo on 12.08.2024.
//

import SwiftUI
import Combine

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = [
        Product(imageName: "adrenalin", badgeType: .new, name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", price: 99.90, oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false, isFavorite: true),
        Product(imageName: "apple", name: "Салат Овощной с Крабовыми Палочками", price: 120.00, oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false),
        Product(imageName: "barbecue",badgeType: .sale, name: "ЭДорадо Охлажденная Непотрошеная 300-400г", price: 367.90, oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false),
        Product(imageName: "bread", name: "Огурцы тепличные cадово-огородные", price: 2100.00, oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false, isFavorite: true),
        Product(imageName: "lidenTree", name: "Дорадо Охлажденная Непотрошеная 300-400г", price: 215.50, oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false),
        Product(imageName: "steak", name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", price: 99.90, oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false),
        Product(imageName: "cucumbers", name: "Огурцы тепличные cадово-огородные", price: 120.90, oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false),
        Product(imageName: "cabbage", name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", price: 99.90, oldPrice: "199,0", description: "Франция", rating: 4.1, reviewsCount: 19, isInCart: false, isFavorite: true)
    ]
    
    @Published var isGridView: Bool = false
    
    func toggleFavorite(for product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].isFavorite.toggle()
        }
    }
    
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
