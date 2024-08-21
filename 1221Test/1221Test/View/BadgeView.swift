//
//  BadgeView.swift
//  1221Test
//
//  Created by udachi_tomo on 16.08.2024.
//

import SwiftUI

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
