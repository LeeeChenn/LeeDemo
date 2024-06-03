//
//  DragGestureView.swift
//  LeeDemo
//
//  Created by 陈景利 on 2024/6/3.
//

import SwiftUI

struct DragGestureView: View {
    @State var isDraging = false
    
    // 拖拽手势
    var drag: some Gesture {
        DragGesture()
            .onChanged{_ in isDraging = true}
            .onEnded{_ in isDraging = false}
    }
    
    var body: some View {
        Circle()
            .fill(isDraging ? .orange : .blue)
            .frame(width: 200, height: 200)
            .gesture(drag)
    }
}

#Preview {
    DragGestureView()
}
