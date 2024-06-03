//
//  AnimatedRotate.swift
//  LeeDemo
//
//  Created by 陈景利 on 2024/6/3.
//

import SwiftUI

struct AnimatedRotate: View {
    @State var showAnimation = false
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut) {
                self.showAnimation.toggle()
            }
        }) {
            Image(systemName: "chevron.right.circle")
                .imageScale(.large)
                .rotationEffect(.degrees(showAnimation ? 90 : 0))
                .scaleEffect(showAnimation ? 2 : 10)
                .padding()
        }
    }
}

#Preview {
    AnimatedRotate()
}
