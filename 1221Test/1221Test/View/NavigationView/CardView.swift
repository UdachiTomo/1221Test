//
//  CardView.swift
//  1221Test
//
//  Created by udachi_tomo on 12.08.2024.
//

import SwiftUI

struct CardView: View {
    @StateObject var viewModel: CardViewModel
    @State private var isGridView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        isGridView.toggle()
                    }) {
                        Image(isGridView ? "list" : "grid")
                            .padding()
                            .frame(width: 45, height: 45)
                            .background(Color.gray.opacity(0.1))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                .offset(x: 10)
                //CartStatusView()
                Divider()
                    .background(Color.gray)
                
                if isGridView {
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



