//
//  GridViewCell.swift
//  1221Test
//
//  Created by udachi_tomo on 17.08.2024.
//

import SwiftUI

struct GridViewCell: View {
    @EnvironmentObject var viewModel: CardViewModel
    @State private var quantity: Double = 0.0
    @State private var unitType: UnitType = .pieces
    @Binding var product: Product
    
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading){
                Image(product.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .cornerRadius(8)
                if let badgeType = product.badgeType {
                    BadgeView(badgeType: badgeType)
                }
                HStack {
                    Spacer()
                    VStack {
                        Button(action: {}) {
                            Image(systemName: "heart")
                                .foregroundColor(.gray)
                        }
                        .padding(.top, 10)
                        
                        Button(action: {}) {
                            Image(systemName: "list.bullet")
                                .foregroundColor(.gray)
                        }
                        .padding(.top, 5)
                    }
                    .padding(.trailing, 10)
                }
            }
            VStack(alignment: .leading) {
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)
                    
                    Text(String(format: "%.1f", product.rating))
                        .font(.caption)
                    
                    Spacer()
                }
                Text(product.name)
                    .font(.system(size: 12))
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 2)
                Text(product.description)
                    .font(.system(size: 12))
                    .foregroundStyle(Color.gray)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 2)
            }
            .padding(.leading, 7)
            HStack {
                HStack {
                    if !product.isInCart {
                        VStack(alignment: .leading) {
                            HStack(spacing: 2) {
                                let (wholePart, fractionalPart) = product.formattedPriceWithSubText
                                Text(wholePart)
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .lineLimit(1)
                                    .fixedSize(horizontal: true, vertical: false)
                                    .foregroundStyle(Color.black)
                                Text(fractionalPart)
                                    .font(.system(size: 16))
                                    .foregroundStyle(Color.black)
                                    .fontWeight(.semibold)
                                Image(.perAmount2)
                                    .foregroundStyle(Color.black)
                            }
                            Text("\(product.oldPrice)")
                                .font(.system(size: 14))
                                .strikethrough()
                                .foregroundStyle(Color.gray)
                        }
                    } else {
                        VStack {
                            Picker("Unit Type", selection: $unitType) {
                                Text("ШТ").tag(UnitType.pieces)
                                Text("КГ").tag(UnitType.kilograms)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(.bottom, 3)
                            
                            HStack {
                                Button(action: {
                                    if unitType == .kilograms {
                                        if quantity > 0.1 {
                                            quantity -= 0.1
                                        } else {
                                            product.isInCart = false
                                            quantity = 0.0
                                        }
                                    } else {
                                        if quantity > 1 {
                                            quantity -= 1
                                        } else {
                                            product.isInCart = false
                                            quantity = 0.0
                                        }
                                    }
                                }) {
                                    Image(systemName: "minus")
                                        .resizable()
                                        .frame(width: 12, height: 2)
                                        .foregroundColor(.white)
                                        .font(Font.system(.title2))
                                        .contentShape(Rectangle())
                                        .padding(.leading, 10)
                                }
                                
                                Spacer()
                                
                                VStack {
                                    if unitType == .kilograms {
                                        Text(String(format: "%.1f кг", quantity))
                                    } else {
                                        Text(String(format: "%.0f шт", quantity))
                                    }
                                    Text(String(format: "%.2f ₽", quantity * product.price))
                                }
                                .font(.caption)
                                .foregroundColor(.white)
                                
                                Spacer()
                                
                                Button(action: {
                                    if unitType == .kilograms {
                                        quantity += 0.1
                                    } else {
                                        quantity += 1
                                    }
                                }) {
                                    Image(systemName: "plus")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                        .foregroundColor(.white)
                                        .font(Font.system(.title2))
                                        .padding(.trailing, 10)
                                }
                            }
                            .frame(height: 30)
                            .background(Color.green)
                            .cornerRadius(20)
                        }
                    }
                    Spacer()
                    Button(action: {
                        product.isInCart.toggle()
                        if product.isInCart {
                            quantity = unitType == .kilograms ? 0.1 : 1
                        }
                    }) {
                        if product.isInCart {
                            Image(systemName: "cart.fill")
                                .frame(width: 48, height: 36)
                                .background(Color.green)
                                .cornerRadius(20)
                                .foregroundColor(.white)
                        } else {
                            Image(.addCart)
                                .frame(width: 48, height: 36)
                                .background(Color.green)
                                .cornerRadius(20)
                                .foregroundColor(.white)
                        }
                    }
                    .animation(.default, value: product.isInCart)
                }
                .frame(height: 75)
                .padding([.leading, .trailing], 4)
                .padding(.bottom, 5)
            }
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 0)
    }
}

struct GridViewCell_Previews: PreviewProvider {
    @State static var previewProduct = Product(
        imageName: "adrenalin",
        name: "FFFF fafafa afafaf",
        price: 99.90,
        oldPrice: "199.90",
        description: "Франция",
        rating: 4.1,
        reviewsCount: 17
    )

    static var previews: some View {
        GridViewCell(product: $previewProduct)
    }
}
