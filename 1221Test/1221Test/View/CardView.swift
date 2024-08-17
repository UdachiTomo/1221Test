//
//  CardView.swift
//  1221Test
//
//  Created by udachi_tomo on 12.08.2024.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var viewModel: CardViewModel
    //@StateObject var viewModel = CardViewModel()
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
                Divider()
                    .background(Color.gray)
                
                if isGridView {
                    GridView()
                } else {
                    ListView()
                        .listStyle(PlainListStyle())
                }
            }
            
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}


