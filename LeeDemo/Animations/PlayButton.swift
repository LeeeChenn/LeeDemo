//
//  PlayButton.swift
//  LeeDemo
//
//  Created by 陈景利 on 2024/6/3.
//

import SwiftUI

struct PlayButton: View {
    
    @State var isPlaying = false
    
    var body: some View {
        Button(action: {
            withAnimation(.easeOut(duration: 0.4)) {
                isPlaying.toggle()
            }
        }, label: {
            if isPlaying {
                Image(systemName: "pause.fill")
                    .scaleEffect(4)
                    .transition(.scale)
                    .transition(.opacity)
            } else {
                Image(systemName: "play.fill")
                    .scaleEffect(4)
                    .transition(.scale)
                    .transition(.opacity)
            }
        })
    }
}

#Preview {
    PlayButton()
}
