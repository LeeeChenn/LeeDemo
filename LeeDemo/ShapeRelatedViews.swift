//
//  ShapeRelatedViews.swift
//  LeeDemo
//
//  Created by 陈景利 on 2024/5/28.
//

import SwiftUI

struct ShapeRelatedViews: View {
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
            Rectangle()
                .frame(width: 100, height: 100)
            
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .frame(width: 100, height: 100)
            
            Circle()
                .frame(width: 100, height: 100)
            
            Capsule()
                .frame(width: 100, height: 50)
            
            Ellipse()
                .frame(width: 100, height: 50)
        })
        .foregroundColor(.yellow)
    }
}

#Preview {
    ShapeRelatedViews()
}
