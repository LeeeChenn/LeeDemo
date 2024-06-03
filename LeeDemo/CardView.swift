//
//  CardView.swift
//  LeeDemo
//
//  Created by 陈景利 on 2024/5/28.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 15)
//                        .stroke(Color.gray, lineWidth: 2)
//                )
            
            VStack {
                Text("Card Title")
                    .font(.headline)
                Text("This is the card content.")
                    .font(.subheadline)
            }
            .padding()
        }
        .padding()
        .frame(height: 200)
    }
}

#Preview {
    CardView()
}
