//
//  AdvancedGestureView.swift
//  LeeDemo
//
//  Created by 陈景利 on 2024/6/3.
//

import SwiftUI

// 进阶组合手势
struct AdvancedGestureView: View {
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
        
        // 同时进行 Simultaneous：所有子手势必须同时满足，系统才会认为满足自定义手势；
//        let customGesture = magnification.simultaneously(with: rotation)
        // 顺序进行 Sequenced：必须按照约定的顺序先后进行手势，才会认为满足自定义手势；
//        let customGesture = magnification.sequenced(before: rotation)
        // 互相排除 Exclusive：子手势中仅有一个被识别出来，才会认为满足自定义手势。
        let customGesture = magnification.exclusively(before: rotation)

        HStack {
            Image("6")
                .gesture(customGesture)
                .rotationEffect(angle)
                .scaleEffect(magnifyBy)
                .animation(.easeInOut)
        }
    }
}

#Preview {
    AdvancedGestureView()
}
