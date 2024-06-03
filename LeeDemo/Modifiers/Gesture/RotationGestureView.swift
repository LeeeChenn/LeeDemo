//
//  RotationGestureView.swift
//  LeeDemo
//
//  Created by 陈景利 on 2024/6/3.
//

import SwiftUI

struct RotationGestureView: View {
    @State var angle = Angle(degrees: 0.0)
    
    var rotation: some Gesture {
        RotationGesture()
            .onChanged {
                angle in
                self.angle = angle
            }
    }
    
    var body: some View {
        Rectangle()
            .foregroundColor(.blue)
            .frame(width: 200, height: 200)
            .rotationEffect(angle)
            .gesture(rotation)
    }
}

#Preview {
    RotationGestureView()
}
