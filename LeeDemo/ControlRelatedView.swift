//
//  ControlRelatedView.swift
//  LeeDemo
//
//  Created by 陈景利 on 2024/5/24.
//

import SwiftUI
import MapKit

struct ControlRelatedView: View {
    @State var toggleValue = true
    @State var pickerValue = 0
    @State var stepperValue = 0
    @State var sliderValue = 0.0
    var pickerOptions = ["步行", "自行车", "汽车"]
    @State var selectedDate = Date()
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .day, value: -100, to: Date())!
        let max = Calendar.current.date(byAdding: .day, value: 100, to: Date())!
        return min...max
    }
    @State var progressValue = 0.5
    @State var location = MKCoordinateRegion(center: .init(latitude: 39.9130, longitude: 116.3907), span: .init(latitudeDelta: 1000, longitudeDelta: 1000))
    
    var body: some View {
        ScrollView {
            HStack {
                // 开关
                VStack(alignment: .leading) {
                    Text("Toggle")
                        .font(.headline)
                    Toggle("自动登录", isOn: $toggleValue)
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                }
                .frame(height: 80)
                .padding()
                .background(Color("WhiteDarkMode"))
                .cornerRadius(15)
                .shadow(radius: 3)
                .padding(.horizontal)
                
                // 按钮
                VStack(alignment: .leading, content: {
                    Text("Button")
                        .font(.headline)
                    Button(action: {
                        //
                    }, label: {
                        Image(systemName: "person.crop.circle.fill.badge.minus")
                            .font(.system(size: 16, weight: .bold))
                        Text("退出")
                            .bold()
                    })
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(15)
                })
                .frame(height: 80)
                .padding()
                .background(Color("WhiteDarkMode"))
                .cornerRadius(15)
                .shadow(radius: 3)
                .padding(.trailing)
            }
            .padding(.bottom)
            
            // 选择器
            VStack(alignment: .leading) {
                Text("Picker")
                    .font(.headline)
                Picker("Picker", selection: $pickerValue) {
                    ForEach(0..<pickerOptions.count) { index in
                        Text(pickerOptions[index]).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .cardStyle()
            
            // 滑动条
            VStack(alignment: .leading, content: {
                Text("Slider")
                    .font(.headline)
                HStack {
                    Image(systemName: "sun.min")
                    Slider(value: $sliderValue, in: -5...5, step: 0.1)
                    Image(systemName: "sun.max.fill")
                }
            })
            .cardStyle()
            
            // 梯度控制
            VStack(alignment: .leading, content: {
                Text("Stepper")
                    .font(.headline)
                Stepper("当前数量：\(stepperValue)", value: $stepperValue, in: -5...5)
            })
            .cardStyle()
            
            // 日期选择
            VStack(alignment: .leading, content: {
                Text("Date Picker")
                    .font(.headline)
                DatePicker(
                    selection: $selectedDate, in: dateRange,
                    displayedComponents: [.hourAndMinute, .date],
                    label: { Text("截止日期") }
                )
            })
            .cardStyle()
            
            HStack {
                // 长按菜单
                VStack(alignment: .leading, content: {
                    Text("Context")
                        .font(.headline)
                    VStack {
                        Image(systemName: "ellipsis.circle.fill")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(.blue)
                            .frame(width: 80, height: 80)
                        Text("长按菜单")
                            .bold()
                            .foregroundColor(.blue)
                    }
                    .contextMenu(ContextMenu(menuItems: {
                        Button("选项 A") { }
                        Button("选项 B") { }
                    }))
                })
                .frame(height: 120)
                .padding()
                .background(Color("WhiteDarkMode"))
                .cornerRadius(15)
                .shadow(radius: 3)
                .padding(.horizontal)
                
                // 载入状态
                VStack(alignment: .leading, content: {
                    Text("Pro")
                        .font(.headline)
                    Spacer()
                    ProgressView(value: progressValue)
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding(.leading)
                        .padding(.top)
                    Spacer()
                })
                .frame(width: 40, height: 120)
                .padding()
                .background(Color("WhiteDarkMode"))
                .cornerRadius(15)
                .shadow(radius: 3)
                .padding(.trailing)
                
                // 地图
                VStack(alignment: .leading, content: {
                    Text("Map")
                        .font(.headline)
                    Map {
                    }
                })
                .frame(height: 120)
                .padding()
                .background(Color("WhiteDarkMode"))
                .cornerRadius(15)
                .shadow(radius: 3)
                .padding(.trailing)
            }
            .padding(.bottom)
            
            CardView()
        }
    }
}

// 用于打包常用修改器
struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
            
            VStack {
                content
            }
            .padding()
        }
        .padding()
//        content
//            .padding()
//            .background(Color("WhiteDarkMode"))
//            .cornerRadius(15)
//            .shadow(radius: 3)
//            .padding(.horizontal)
//            .padding(.bottom)
    }
}

// 用于将打包好的修改器转化为易用函数
extension View {
    func cardStyle() -> some View {
        self.modifier(CardModifier())
    }
}


#Preview {
    ControlRelatedView()
}
