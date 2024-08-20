//
//  CardView.swift
//  1221Test
//
//  Created by udachi_tomo on 12.08.2024.
//

import SwiftUI

struct NavigationView: View {
    @StateObject var viewModel: CardViewModel
    //@StateObject var viewModel = CardViewModel()
    @State private var isGridView: Bool = false
    
    var body: some View {
        NavigationView {
                   VStack {
                       Picker("View Style", selection: $viewModel.isGridView) {
                           Text("List View").tag(false)
                           Text("Grid View").tag(true)
                       }
                       .pickerStyle(SegmentedPickerStyle())
                       .padding()

                       if viewModel.isGridView {
                           GridView()
                               .environmentObject(viewModel)
                       } else {
                           ListView()
                               .environmentObject(viewModel)
                               .listStyle(PlainListStyle())
                       }
                   }
               }
//        NavigationView {
//            VStack {
//                HStack {
//                    Button(action: {
//                        isGridView.toggle()
//                    }) {
//                        Image(isGridView ? "list" : "grid")
//                            .padding()
//                            .frame(width: 45, height: 45)
//                            .background(Color.gray.opacity(0.1))
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                    }
//                    Spacer()
//                }
//                CartStatusView()
//                .offset(x: 10)
//                Divider()
//                    .background(Color.gray)
//                
//                if isGridView {
//                    GridView()
//                        .environmentObject(viewModel)
//                } else {
//                    ListView()
//                        .environmentObject(viewModel)
//                        .listStyle(PlainListStyle())
//                }
//            }
//            
//        }
    }
}
//
//struct ProductListView_Previews: PreviewProvider {
//    @StateObject var viewModel: CardViewModel
//    static var previews: some View {
//        CardView(viewModel: viewModel)
//    }
//}


