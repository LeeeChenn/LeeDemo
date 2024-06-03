//
//  HierarchyRelatedView.swift
//  LeeDemo
//
//  Created by 陈景利 on 2024/5/27.
//

import SwiftUI

struct HierarchyRelatedView: View {
    let circleRadius: CGFloat = 62
    let names = ["天气", "第七", "玩笑", "可都", "得瑟", "地方", "色调", "更多", "分段",
        "嗯嗯", "广告", "的额", "老李", "各个", "规格", "十二", "规是", "修复", "带点", "刚刚"]
    @State var showModal = false
    @State var showActionSheet = false
    @State var showAlert = false
    @State var showAlert2 = false
    var body: some View {
        TabView {
            // 1.滑动视图
            GeometryReader { fullView in
                ScrollView(.horizontal, showsIndicators: false) {
                    ScrollViewReader { value in
                        Spacer()
                        HStack {
                            ForEach((0..<20), id: \.self) { index in
                                GeometryReader { geo in
                                    VStack {
                                        let distAbs = abs(fullView.frame(in: .global).midX - geo.frame(in: .global).midX)
                                        let centered = isCentered(distAbs: distAbs)
                                        
                                        ZStack {
                                            Image("\(index)")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .font(.system(size: circleRadius))
                                        }
                                        .scaleEffect(x: centered ? 1 : 0.7, y: centered ? 1 : 0.7)
                                        Text("\(names[index])")
                                            .font(centered ? .system(size: 20, weight: .bold) : .system(size: 15, weight: .semibold))
                                    }
                                    .id(index)
                                }.frame(width: circleRadius, height: circleRadius * 2)
                            }
                        }
                        .padding()
                        Spacer()
                    }
                }
            }
            .tabItem {
                    Image(systemName: "scroll")
                    Text("Scroll")
                }
            // 2.选项卡内容
            NavigationView {
                VStack {
                    VStack(spacing: 30, content: {
                        NavigationLink(destination: ShapeRelatedViews()) {
                            
                            HStack {
                                Image("icon")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(15)
                                    .shadow(radius: 10)
                                VStack(alignment: .leading, content: {
                                    Text("独立开发指南")
                                        .font(.title2)
                                        .bold()
                                        .padding(.bottom, 5)
                                    Text("将你的创作变现，让世界精彩些。")
                                        .font(.body)
                                        .foregroundColor(.gray)
                                    HStack {
                                        Spacer()
                                        Image(systemName: "arrowshape.turn.up.right")
                                            .font(.system(size: 16, weight: .bold))
                                    }
                                })
                                .padding(.leading)
                            }
                            .cardStyle()
                            .frame(maxHeight: 200)
                        }
                    })
                }
                .navigationBarTitle("项目列表", displayMode: .automatic)
                .navigationBarItems(
                    leading:
                        Button("左侧按钮") {},
                    trailing:
                        Button("右侧按钮") {}
                )
            }
            .tabItem {
                    Image(systemName: "network")
                    Text("Navigation")
                }
            // 3. 弹窗视图
            VStack(spacing: 50) {
                Button(action: {
                    showModal.toggle()
                }) {
                    Text("显示「长弹窗」")
                        .font(.headline)
                        .cardStyle()
                        .frame(height: 100)
                }.sheet(isPresented: $showModal, content: {
                    ShapeRelatedViews()
                })
                
                Button(action: {
                    showActionSheet.toggle()
                }, label: {
                    Text("显示「行动列表」")
                        .font(.headline)
                        .cardStyle()
                        .frame(height: 100)
                })
                .actionSheet(isPresented: $showActionSheet, content: {
                    ActionSheet(title: Text("执行什么操作？"), message: Text("补充文字说明"), buttons: [
                        .default(Text("添加至收藏夹")) {},
                        .destructive(Text("删除项目")) {},
                        .cancel()
                    ])
                })
            }
            .tabItem {
                    Image(systemName: "square.stack")
                    Text("Modal")
                }
            // 选项卡 4：警告视图
            VStack(spacing: 50, content: {
                Button(action: {
                    showAlert.toggle()
                }) {
                    Text("显示「允许选择的警告」")
                        .font(.headline)
                        .cardStyle()
                        .frame(height: 100)
                }
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text("删除"), message: Text("此操作会永久移除该文件，你确定要继续吗？"), primaryButton: .destructive(Text("是")), secondaryButton: .default(Text("否")))
                })
                
                Button(action: {
                    showAlert2.toggle()
                }) {
                    Text("显示「通知型警告」")
                        .font(.headline)
                        .cardStyle()
                        .frame(height: 100)
                }
                .alert(isPresented: $showAlert2, content: {
                    Alert(title: Text("用时较长"), message: Text("执行该操作预计用时 5 分钟以上，请保持应用在前台状态。"), dismissButton: .default(Text("我知道了")))
                })
            })
            .tabItem {
                    Image(systemName: "exclamationmark.triangle")
                    Text("Alert")
                }
        }
    }
    
    func isCentered(distAbs: CGFloat) -> Bool {
        distAbs < (circleRadius / 2 + 5)
    }
}

#Preview {
    HierarchyRelatedView()
}
