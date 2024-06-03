//
//  TagGestureView.swift
//  LeeDemo
//
//  Created by 陈景利 on 2024/6/3.
//

import SwiftUI

struct TagGestureView: View {
    @State var currentGesture = "无"
    @State var imageNames = ["hare", "tortoise", "cloud", "moon", "wind"]
    @State var currentImageName = "questionmark"
    var body: some View {
        VStack {
            Text("识别出的手势：\(currentGesture)")
                .font(.largeTitle)
                .bold()
            Divider().padding()
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                Image(systemName: currentImageName)
                    .resizable()
                    .scaleEffect(0.3)
                    .scaledToFit()
            }
            .padding()
            .onTapGesture {
                currentImageName = imageNames.randomElement()!
                currentGesture = "轻点"
            }
            Spacer()
        }
    }
}

#Preview {
    TagGestureView()
}
