//
//  LongPressGestureView.swift
//  LeeDemo
//
//  Created by 陈景利 on 2024/6/3.
//

import SwiftUI

struct LongPressGestureView: View {
    @State var currentGesture = "无"
    @State var longPressed = false
    var body: some View {
        VStack {
            Text("识别出的手势：\(currentGesture)")
                .font(.largeTitle)
                .bold()
            
            Divider().padding()
            
            RoundedRectangle(cornerRadius: 25.0)
                .aspectRatio(1, contentMode: .fit)
                .foregroundColor(longPressed ? .orange : .blue)
                .padding()
                .onLongPressGesture {
                    currentGesture = "长按"
                    longPressed.toggle()
                }
        }
    }
}

#Preview {
    LongPressGestureView()
}
