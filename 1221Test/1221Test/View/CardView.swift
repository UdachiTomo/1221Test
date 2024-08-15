//
//  CardView.swift
//  1221Test
//
//  Created by udachi_tomo on 12.08.2024.
//

import SwiftUI

struct CardView: View {
    @StateObject var viewModel = CardViewModel()
    @State private var isGridView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        isGridView.toggle()
                    }) {
                        Image(isGridView ? "list" : "grind")
                            .padding()
                            .frame(width: 45, height: 45)
                            .background(Color.gray.opacity(0.1))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                .offset(x: 10)
                Divider()
                    .background(Color.gray)
                
                if isGridView {
                    GridView(cards: $viewModel.cards)
                } else {
                    ListView(cards: $viewModel.cards)
                        .listStyle(PlainListStyle())
                }
            }
            
        }
    }
}

struct ListView: View {
    @Binding var cards: [Card]
    var body: some View {
        List($cards) { $card in
            HStack(alignment: .center) {
                Image(card.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .cornerRadius(8)
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            HStack(spacing: 2) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text("\(card.rating, specifier: "%.1f")")
                                    .font(.system(size: 12))
                                HStack(spacing: 2) {
                                    Text("| \(card.reviewsCount)")
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
                                Text(card.name)
                                    .font(.system(size: 12))
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.top, 2)
                                Text(card.description)
                                    .font(.system(size: 12))
                                    .foregroundStyle(Color.gray)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.top, 2)
                            }
                        }
                        .frame(width: 140)
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
                        .padding(.bottom, 30)
                    }
                    //Spacer()
                    
                    HStack() {
                        VStack(alignment: .leading) {
                            if !card.isInCart {
                                HStack {
                                    Text("\(card.price)")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .lineLimit(1)
                                        .fixedSize(horizontal: true, vertical: false)
                                        .foregroundStyle(Color.black)
                                    Image(.perAmount2)
                                        .foregroundStyle(Color.black)
                                }
                                Text("\(card.oldPrice)")
                                    .font(.system(size: 14))
                                    .strikethrough()
                                    .foregroundStyle(Color.gray)
                            }
                        }
                        Spacer()
                        AddToCartButton(pricePerKg: 99.9, isInCart: $card.isInCart, unitType: $card.unitType)
                            .buttonStyle(PlainButtonStyle())
                            .contentShape(Rectangle())
                    }
                }
                .frame(width: 170, height: 180, alignment: .center)
            }
            .padding(.vertical)
            
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct GridView: View {
    @Binding var cards: [Card]
    let columns: [GridItem] = [
        GridItem(.flexible(),spacing: 3),
        GridItem(.flexible(), spacing: 3)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach($cards) { $card in
                    VStack {
                        ZStack(alignment: .topLeading){
                            Image(card.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 150)
                                .cornerRadius(8)
                            if let badgeType = card.badgeType {
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
                                            
                                            Text(String(format: "%.1f", card.rating))
                                                .font(.caption)
                                            
                                            Spacer()
                                        }
                            Text(card.name)
                                .font(.system(size: 12))
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.top, 2)
                            Text(card.description)
                                .font(.system(size: 12))
                                .foregroundStyle(Color.gray)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.top, 2)
                        }
                        .padding(.leading, 5)
                        HStack {
                            VStack(alignment: .leading) {
                                if !card.isInCart {
                                    HStack {
                                        Text("\(card.price)")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .lineLimit(1)
                                            .fixedSize(horizontal: true, vertical: false)
                                            .foregroundStyle(Color.black)
                                        Image(.perAmount2)
                                            .foregroundStyle(Color.black)
                                    }
                                    Text("\(card.oldPrice)")
                                        .font(.system(size: 14))
                                        .strikethrough()
                                        .foregroundStyle(Color.gray)
                                }
                            }
                            Spacer()
                            AddToCartButton(pricePerKg: 99.9, isInCart: $card.isInCart, unitType: $card.unitType)
                                .buttonStyle(PlainButtonStyle())
                                .contentShape(Rectangle())
                                .offset(x: -5)
                        }
                        .padding()
                        .frame(width: 182, height: 90)
                    }
                    
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 0)
                    
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
        }
    }
}

struct AddToCartButton: View {
    var pricePerKg: Double
    @Binding var isInCart: Bool
    @Binding var unitType: UnitType
    @State private var quantity = 0.0
    @State private var showUnitPicker = false
    var body: some View {
        VStack {
            if isInCart {
                if showUnitPicker {
                    Picker("Unit Type", selection: $unitType) {
                        Text("ШТ").tag(UnitType.pieces)
                        Text("КГ").tag(UnitType.kilograms)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.bottom, 5)
                    
                    if unitType == .kilograms {
                        HStack {
                            Button(action: {
                                if quantity > 0.5 {
                                    quantity -= 0.5
                                } else {
                                    isInCart = false
                                    quantity = 0.0
                                }
                            }) {
                                Image(systemName: "minus")
                                    .foregroundColor(.white)
                                    .font(Font.system(.title2))
                                
                            }
                            .padding(.leading, 10)
                            Spacer()
                            VStack {
                                Text(String(format: "%.0f кг", quantity))
                                Text(String(format: "%.2f ₽", quantity * pricePerKg))
                            }
                            .font(.caption)
                            .foregroundColor(.white)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(1)
                            .frame(minWidth: 40, alignment: .center)
                            Spacer()
                            Button(action: {
                                quantity += 0.5
                            }) {
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .font(Font.system(.title2))
                            }
                            .padding(.trailing, 10)
                        }
                        .frame(width: 170, height: 36)
                        .background(Color.green)
                        .cornerRadius(15)
                    } else {
                        HStack {
                            Button(action: {
                                if quantity > 1 {
                                    quantity -= 1
                                } else {
                                    isInCart = false
                                    quantity = 0.0
                                }
                            }) {
                                Image(systemName: "minus")
                                    .foregroundColor(.white)
                                    .font(Font.system(.title2))
                            }
                            .padding(.leading, 10)
                            Spacer()
                            VStack {
                                Text(String(format: "%.0f шт", quantity))
                                Text(String(format: "%.2f ₽", quantity * pricePerKg))
                            }
                            .font(.caption)
                            .foregroundColor(.white)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(minWidth: 40, alignment: .center)
                            .lineLimit(1)
                            Spacer()
                            Button(action: {
                                quantity += 1
                            }) {
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .font(Font.system(.title2))
                            }
                            .padding(.trailing, 10)
                        }
                        .frame(width: 170, height: 36, alignment: .center)
                        .background(Color.green)
                        .cornerRadius(15)
                    }
                } else {
                    Button(action: {
                        showUnitPicker.toggle()
                        isInCart = true
                        quantity = unitType == .kilograms ? 0.5 : 1
                    }) {
                        Image(.addCart)
                            .padding(15)
                            .background(Color.green)
                            .foregroundStyle(Color.white)
                            .cornerRadius(17)
                    }
                }
            } else {
                Button(action: {
                    isInCart = true
                    showUnitPicker = true
                    quantity = unitType == .kilograms ? 0.5 : 1
                }) {
                    Image(.addCart)
                        .padding(15)
                        .background(Color.green)
                        .foregroundStyle(Color.white)
                        .cornerRadius(17)
                }
            }
        }
    }
}

struct BadgeView: View {
    var badgeType: BadgeType
    
    var body: some View {
        Text(badgeType.text)
            .font(.caption2)
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 2, leading: 15, bottom: 2, trailing: 10))
            .background(badgeType.backgroundColor)
            .cornerRadius(10, corners: [.bottomRight, .topRight, .topLeft])
            .padding(6)
            .padding(.top, -6)
            .padding(.leading, -8)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCornerShape(radius: radius, corners: corners))
    }
}

struct RoundedCornerShape: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

enum UnitType {
    case pieces
    case kilograms
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}


