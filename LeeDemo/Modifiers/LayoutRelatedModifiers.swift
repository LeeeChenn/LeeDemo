//
//  LayoutRelatedModifiers.swift
//  LeeDemo
//
//  Created by 陈景利 on 2024/6/1.
//

import SwiftUI

struct LayoutRelatedModifiers: View {
    @State var textFieldInput = ""
    @State var isHidden = false
    var body: some View {
        VStack {
            // 隐藏
            if !isHidden {
                TextField("文本框", text: $textFieldInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
//                    .hidden()
            }
            
            // 转化为占位符
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("大标题")
                                .font(.largeTitle)
                                .border(Color.orange)
                            Text("一些非常复杂的正文内容")
                                .font(.body)
                                .foregroundStyle(.blue)
                        }
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("大标题")
                                .font(.largeTitle)
                            Text("一些非常复杂的正文内容")
                                .font(.body)
                                .foregroundStyle(.blue)
                        }
                    }
                    .redacted(reason: .placeholder)
                }
                
                Spacer()
                Toggle("Hide", isOn: $isHidden)
                    .labelsHidden()
            }
            .padding(.horizontal)
            
            // 安全区
            Rectangle()
                .cornerRadius(15)
                .foregroundColor(.orange)
                .padding()
//                .ignoresSafeArea(.keyboard)
            
            // 框架与尺寸
            HStack(spacing: 0) {
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(minWidth: 100, idealWidth: 200, maxWidth: 300)
                    .frame(height: 200)
            }
            .padding()
            
            // 边缘安全区
            Rectangle()
                .foregroundColor(.orange)
                .edgesIgnoringSafeArea([.top, .bottom])
        }
    }
}

#Preview {
    LayoutRelatedModifiers()
}
