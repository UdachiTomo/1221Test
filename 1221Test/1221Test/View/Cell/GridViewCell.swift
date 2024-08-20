//
//  GridViewCell.swift
//  1221Test
//
//  Created by udachi_tomo on 17.08.2024.
//

import SwiftUI

struct GridViewCell: View {
    @EnvironmentObject var viewModel: CardViewModel
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
                            Picker("Unit Type", selection: $product.unitType) {
                                Text("ШТ").tag(UnitType.pieces)
                                Text("КГ").tag(UnitType.kilograms)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(.bottom, 3)
                            
                            HStack {
                                Button(action: {
                                    if product.unitType == .kilograms {
                                        if product.quantity > 0.5 {
                                            product.quantity -= 0.5
                                        } else {
                                            viewModel.removeFromCart(product: product)
                                            product.quantity = 0.0
                                        }
                                    } else {
                                        if product.quantity > 1 {
                                            product.quantity -= 1
                                        } else {
                                            viewModel.removeFromCart(product: product)
                                            product.quantity = 0.0
                                        }
                                    }
                                }) {
                                    Image(systemName: "minus")
                                        .frame(width: 10)
                                        .foregroundColor(.white)
                                        .font(Font.system(.title2))
                                        .contentShape(Rectangle())
                                        .padding(.leading, 10)
                                }
                                
                                Spacer()
                                
                                VStack {
                                    if product.unitType == .kilograms {
                                        Text(String(format: "%.1f кг", product.quantity))
                                    } else {
                                        Text(String(format: "%.0f шт", product.quantity))
                                    }
                                    Text(String(format: "%.2f ₽", product.quantity * product.price))
                                }
                                .font(.caption)
                                .foregroundColor(.white)

                                Spacer()
                                
                                Button(action: {
                                    if product.unitType == .kilograms {
                                        product.quantity += 0.5
                                    } else {
                                        product.quantity += 1
                                    }
                                }) {
                                    Image(systemName: "plus")
                                        .frame(width: 10)
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
                        if !product.isInCart {
                            viewModel.updateQuantity(product: product, quantity: product.quantity, unitType: product.unitType)
                           
                        } else {
                            viewModel.addToCart(product: product)
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
