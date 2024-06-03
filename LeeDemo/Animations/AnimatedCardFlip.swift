//
//  AnimatedCardFlip.swift
//  LeeDemo
//
//  Created by 陈景利 on 2024/6/3.
//

import SwiftUI

struct AnimatedCardFlip: View {
    @State private var front = false
    
    var body: some View {
        VStack {
            Image(systemName: "suit.club.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .frame(width: 200, height: 100)
                .foregroundColor(front ? .white : .black)
                .background(front ? .black : .white)
                .cornerRadius(20)
                .shadow(radius: 20)
                .scaleEffect(front ? 1.2 : 0.8)
                .rotation3DEffect(
                    Angle(degrees: front ? 0 : 180),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
                .animation(.spring(response: 1.5), value: front)
                .onTapGesture {
                    self.front.toggle()
                }
        }
    }
}

#Preview {
    AnimatedCardFlip()
}
