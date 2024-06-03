//
//  ImageTransitionTwo.swift
//  LeeDemo
//
//  Created by 陈景利 on 2024/6/3.
//

import SwiftUI

struct ImageTransitionTwo: View {
    
    @State var playTransition = true
    
    var body: some View {
        VStack {
            if playTransition {
                Image("Dandelion")
                    .resizable()
                    .transition(.asymmetric(insertion: .slide, removal: .scale))
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
            
            Button(action: {
                withAnimation{
                    playTransition.toggle()
                }
            }) {
                Text("播放动画")
            }
        }
    }
}

#Preview {
    ImageTransitionTwo()
}
