//
//  ImageTransition.swift
//  LeeDemo
//
//  Created by 陈景利 on 2024/6/3.
//

import SwiftUI

struct ImageTransition: View {
    
    @State var playTransition = false
    
    var body: some View {
        VStack {
            Image("Dandelion")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .scaleEffect(playTransition ? 0.5 : 1)
                .onTapGesture {
                    withAnimation {
                        playTransition.toggle()
                    }
                }
        }
    }
}

#Preview {
    ImageTransition()
}
