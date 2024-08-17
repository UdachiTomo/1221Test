//
//  ListViewCell.swift
//  1221Test
//
//  Created by udachi_tomo on 17.08.2024.
//

import SwiftUI

struct ListViewCell: View {
    @EnvironmentObject var viewModel: CardViewModel
    @State private var quantity: Double = 0.0
    @State private var unitType: UnitType = .pieces
    @Binding var product: Product
    
    var body: some View {
        HStack(alignment: .center) {
            ZStack(alignment: .topLeading){
                Image(product.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .cornerRadius(8)
                
                if let badgeType = product.badgeType {
                    BadgeView(badgeType: badgeType)
                        .padding(.top, -15)
                }
                Text("25%")
                    .font(.headline)
                    .foregroundColor(.red)
                    .padding(.all, 4)
                    .background(Color.clear)
                    .padding(.top, 140)
                    .padding(.leading, 90)
            }
            ZStack {
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("\(product.rating, specifier: "%.1f")")
                            .font(.system(size: 12))
                        HStack(spacing: 2) {
                            Text("| \(product.reviewsCount)")
                                .font(.system(size: 12))
                                .foregroundStyle(Color.gray)
                            Text("отзывов")
                                .font(.system(size: 12))
                                .foregroundStyle(Color.gray)
                        }
                        .lineLimit(1)
                        .fixedSize(horizontal: true, vertical: false)
                    }
                    VStack(alignment: .leading) {
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
                    .padding(.trailing, 35)
                    HStack() {
                        HStack() {
                            if !product.isInCart {
                                VStack(alignment: .leading) {
                                    HStack(spacing: 5) {
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
                                    .padding(.bottom, 5)
                                    
                                    HStack {
                                        Button(action: {
                                            if unitType == .kilograms {
                                                if quantity > 0.5 {
                                                    quantity -= 0.5
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
                                                .foregroundColor(.white)
                                                .font(Font.system(.title2))
                                                .contentShape(Rectangle())
                                                .padding(.leading, 2)
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
                                                quantity += 0.5
                                            } else {
                                                quantity += 1
                                            }
                                        }) {
                                            Image(systemName: "plus")
                                                .foregroundColor(.white)
                                                .font(Font.system(.title2))
                                                .padding(.trailing, 2)
                                        }
                                    }
                                    .frame(height: 36)
                                    .background(Color.green)
                                    .cornerRadius(20)
                                }
                            }
                            Spacer()
                            Button(action: {
                                product.isInCart.toggle()
                                if product.isInCart {
                                    quantity = unitType == .kilograms ? 0.5 : 1
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
                        .padding(.leading, 2)
                        
                    }
                    .padding(.top, 50)
                    
                    .frame(height: 75)
                }
                .padding(.leading, 5)
                .padding(.top, -25)
                VStack {
                    Button(action: {
                    }) {
                        Image(systemName: "heart")
                            .foregroundStyle(Color.gray)
                    }
                    .padding(.bottom, 8)
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "list.bullet")
                            .foregroundStyle(Color.gray)
                    }
                }
                .padding(.leading, 175)
                .padding(.top, -80)
            }
        }
        
        .padding(.vertical)
    }
}


struct ListViewCell_Previews: PreviewProvider {
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
        ListViewCell(product: $previewProduct)
    }
}
