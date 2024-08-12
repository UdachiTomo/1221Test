//
//  CardView.swift
//  1221Test
//
//  Created by udachi_tomo on 12.08.2024.
//

import SwiftUI

struct CardView: View {
    @StateObject var viewModel = CardViewModel()
    
    var body: some View {
        List(viewModel.cards) { card in
            HStack(alignment: .top) {
                Image(card.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .cornerRadius(8)
                VStack {
                    HStack {
                        VStack() {
                            HStack(spacing: 5) {
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
                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 25, trailing: 5))
                    }
                    Spacer()
                    HStack() {
                        Text("\(card.price)")
                            .font(.system(size: 20))
                
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .fixedSize(horizontal: true, vertical: false)
                            .foregroundStyle(Color.black)
                        Image(.perAmount2)
                            .foregroundStyle(Color.black)
                        Button(action: {
                            
                        }) {
                            Image(.addCart)
                                .padding(15)
                                .background(Color.green)
                                .foregroundStyle(Color.white)
                                .cornerRadius(17)
                        }
                        .padding(.leading, 25)
                    }
                    .padding(.leading, 10)
                }
            }
            .padding(.vertical)
        }
        .navigationTitle("Продукты")
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}

