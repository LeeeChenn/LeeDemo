//
//  ContentView.swift
//  LeeDemo
//
//  Created by 陈景利 on 2024/5/14.
//

import SwiftUI

func trunc() async {
    for i in 0...1_000_000_000 {
        print(i)
    }
}

struct ContentView: View {
    var body: some View {
        LayoutRelatedModifiers()
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hi, git!")
//            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
//            }.task {
////                await trunc()
//            }
//        }
//        .padding()
    }
}

#Preview {
    ContentView()
}

// new message again
// i want to go to 

