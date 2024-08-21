//
//  CardView.swift
//  1221Test
//
//  Created by udachi_tomo on 12.08.2024.
//

import SwiftUI

struct CardView: View {
    @StateObject var viewModel: ProductViewModel

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        viewModel.isGridView.toggle()
                    }) {
                        Image(viewModel.isGridView ? "list" : "grid")
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
                
                if viewModel.isGridView {
                    GridView()
                        .environmentObject(viewModel)
                } else {
                    ListView()
                        .listStyle(PlainListStyle())
                        .environmentObject(viewModel)
                }
            }
        }
    }
}



