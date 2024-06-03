//
//  MagnificationGestureView.swift
//  LeeDemo
//
//  Created by 陈景利 on 2024/6/3.
//

import SwiftUI

struct MagnificationGestureView: View {
    @GestureState var magnifyBy = CGFloat(1.0)
    
    var magnification: some Gesture {
        MagnificationGesture()
            .updating($magnifyBy) {
                currentState, gestureState, transaction in
                gestureState = currentState
            }
    }
    
    var body: some View {
        Circle()
            .foregroundColor(.blue)
            .frame(width: 200 * magnifyBy, height: 200 * magnifyBy)
            .gesture(magnification)
    }
}

#Preview {
    MagnificationGestureView()
}
