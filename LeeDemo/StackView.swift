//
//  DemoView.swift
//  LeeDemo
//
//  Created by 陈景利 on 2024/5/24.
//

import SwiftUI

struct StackView: View {
    var body: some View {
        VStack {
            VStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous)
                    .foregroundColor(.blue)
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous)
            }
            .opacity(0.7)
            .foregroundColor(.orange)
            .frame(width: 100, height: 200)
            .padding()
            .background(.white)
            .cornerRadius(25)
            .shadow(radius: 10)
            
            Text("VStack")
                .font(.headline)
        }
        Divider().padding()
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous)
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous)
            }
            .opacity(0.7)
            .foregroundColor(.blue)
            .frame(width: 200, height: 100)
            .padding()
            .background(.white)
            .cornerRadius(25)
            .shadow(radius: 10)
            
            Text("HStack")
                .font(.headline)
        }
        Divider().padding()
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous)
                    .offset(CGPoint(x: -5, y: -3))
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous)
                    .offset(CGPoint(x: 5, y: 6))
            }
        }
        .opacity(0.7)
        .foregroundColor(.red)
        .frame(width: 200, height: 100)
        .padding()
        .background(.white)
        .cornerRadius(25)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        
        Text("ZStack")
            .font(.headline)
    }
}

#Preview {
    StackView()
}
