//
//  PriorGestureView.swift
//  LeeDemo
//
//  Created by 陈景利 on 2024/6/3.
//

import SwiftUI

// 手势优先级
struct PriorGestureView: View {
    @State var magnifyBy = CGFloat(1.0)
    @State var angle = Angle(degrees: 0.0)
    
    var body: some View {
        let magnification = MagnificationGesture()
            .onChanged{ magnifyBy in
                self.magnifyBy = magnifyBy
            }
        let rotation = RotationGesture()
            .onChanged{ angle in
                self.angle = angle
            }
        HStack {
            Image("6")
                .gesture(rotation)
                .rotationEffect(angle)
        }
//        .gesture(magnification)
        .highPriorityGesture(magnification)
        .scaleEffect(magnifyBy)
    }
}

#Preview {
    PriorGestureView()
}
