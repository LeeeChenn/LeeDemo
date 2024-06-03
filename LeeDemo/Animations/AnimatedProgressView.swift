//
//  AnimatedProgressView.swift
//  LeeDemo
//
//  Created by 陈景利 on 2024/6/3.
//

import SwiftUI

struct AnimatedProgressView: View {
    
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 6)
                .frame(width: 90, height: 90)
                .foregroundColor(Color(.systemGray6))
            
            Rectangle()
                .frame(width: 24, height: 24)
                .foregroundColor(.orange)
                .cornerRadius(2)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                .frame(width: 90, height: 90)
                .foregroundStyle(.orange)
                .rotationEffect(.degrees(-90))
                .animation(Animation.easeInOut.speed(0.25), value: progress)
                .onAppear() {
                    self.progress = 1
                }
        }
    }
}

#Preview {
    AnimatedProgressView()
}
