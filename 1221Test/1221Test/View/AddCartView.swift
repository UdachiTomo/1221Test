//
//  AddCartView.swift
//  1221Test
//
//  Created by udachi_tomo on 16.08.2024.
//

import SwiftUI


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
                                        .font(.system(.title2))
                                        .contentShape(Rectangle())
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
                                    isInCart = true
                                    quantity += 0.5
                                }) {
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                        .font(.system(.title2))
                                }
                                .padding(.trailing, 10)
                            }
                            .frame(height: 36)
                            .background(Color.green)
                            .cornerRadius(20)
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
                                        .font(.system(.title2))
                                        .contentShape(Rectangle())
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
                                        .font(.system(.title2))
                                }
                                .padding(.trailing, 10)
                            }
                            .frame(height: 36)
                            .background(Color.green)
                            .cornerRadius(20)
                        }
                    } else {
                        Button(action: {
                            showUnitPicker.toggle()
                            quantity = unitType == .kilograms ? 0.5 : 1
                        }) {
                            Image(.addCart)
                                .frame(width: 48, height: 36)
                                //.padding(12)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                    }
                } else {
                    Button(action: {
                        isInCart = true
                        showUnitPicker = true
                        quantity = unitType == .kilograms ? 0.5 : 1
                    }) {
                        Image(.addCart)
                            .frame(width: 48, height: 36)
                           // .padding(12)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
    
    
    //@ObservedObject var viewModel: AddCartViewModel
    //@Binding var viewModel: AddCartViewModel
    
    //    var body: some View {
    //        VStack {
    //            if viewModel.product.isInCart {
    //                if viewModel.showUnitPicker {
    //                    Picker("Unit Type", selection: $unitType) {
    //                        Text("ШТ").tag(UnitType.pieces)
    //                        Text("КГ").tag(UnitType.kilograms)
    //                    }
    //                    .pickerStyle(SegmentedPickerStyle())
    //                    .padding(.bottom, 5)
    //
    //                    HStack {
    //                        Button(action: {
    //                            viewModel.decreaseQuantity()
    //                        }) {
    //                            Image(systemName: "minus")
    //                                .foregroundColor(.white)
    //                                .font(.title2)
    //                        }
    //                        .padding(.leading, 10)
    //
    //                        Spacer()
    //
    //                        VStack {
    //                            Text(viewModel.product.unitType == .kilograms
    //                                 ? String(format: "%.0f кг", viewModel.product.quantity)
    //                                 : String(format: "%.0f шт", viewModel.product.quantity))
    //                                Text(String(format: "%.2f ₽", viewModel.product.quantity * viewModel.product.price))
    //                        }
    //                        .font(.caption)
    //                        .foregroundColor(.white)
    //                        .fixedSize(horizontal: false, vertical: true)
    //                        .lineLimit(1)
    //                        .frame(minWidth: 40, alignment: .center)
    //
    //                        Spacer()
    //
    //                        Button(action: {
    //                            viewModel.increaseQuantity()
    //                        }) {
    //                            Image(systemName: "plus")
    //                                .foregroundColor(.white)
    //                                .font(.title2)
    //                        }
    //                        .padding(.trailing, 10)
    //                    }
    //                    .frame(height: 36)
    //                    .background(Color.green)
    //                    .cornerRadius(15)
    //                } else {
    //                    Button(action: {
    //                        viewModel.toggleCart()
    //                    }) {
    //                        Image(systemName: "cart.fill.badge.plus")
    //                            .padding(15)
    //                            .background(Color.green)
    //                            .foregroundStyle(Color.white)
    //                            .cornerRadius(17)
    //                    }
    //                }
    //            } else {
    //                Button(action: {
    //                    viewModel.toggleCart()
    //                }) {
    //                    Image(systemName: "cart.fill.badge.plus")
    //                        .padding(15)
    //                        .background(Color.green)
    //                        .foregroundStyle(Color.white)
    //                        .cornerRadius(17)
    //                }
    //            }
    //        }
    //        .frame(maxWidth: .infinity)
    //    }
    //}
}
