//
//  RegView.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 08. 20..
//

import SwiftUI

struct OnboardingView: View {
    @State var StepsNum: Int = 5
    @State var CurrentStep: Int = 0
    @State var userName: String
    @State var metrics: [MetricItem] = [
            MetricItem(title: "CURRENT WEIGHT", unit: "kg", config: .init(count: 30, steps: 10, spacing: 10), value: 95),
            MetricItem(title: "HEIGHT", unit: "cm", config: .init(count: 30, steps: 10, spacing: 10), value: 180)
        ]
        @State var selectedGender: String = "MALE"
    var body: some View {
            ZStack {
                AppBackground()
                    .ignoresSafeArea()
                
                VStack {
                    ProgressBar(StepsNum: StepsNum, CurrentStep: $CurrentStep)
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                    switch CurrentStep {
                    case 0:
                        NameStepView(userName: $userName, onNext: {
                            withAnimation {
                                CurrentStep += 1
                            }
                        })
                    case 1:
                        DatasView(metrics: $metrics, gender: $selectedGender, onNext: {
                                withAnimation {
                                    CurrentStep += 1
                                }
                            })
                    case 2:
                        Text("Itt lesz az Életmód kártya")
                    case 3:
                        Text("Itt lesz a Cél kártya")
                    case 4:
                        Text("Itt lesz a Tempó kártya")
                    default:
                        EmptyView()
                    }
                    HStack {
                        Button(action: {
                            withAnimation {
                                if CurrentStep > 0 {
                                    CurrentStep -= 1
                                }
                            }
                        }, label: {
                            Text("Back")
                        })
                        .padding(.horizontal)
                        
                        Button(action: {
                            withAnimation {
                                if CurrentStep < StepsNum {
                                    CurrentStep += 1
                                }
                            }
                        }, label: {
                            Text("Next")
                        })
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            .gesture(
                    DragGesture()
                        .onEnded { value in
                            if value.startLocation.x < 50 && value.translation.width > 50 {
                                if CurrentStep > 0 {
                                    withAnimation {
                                        CurrentStep -= 1
                                    }
                                }
                            }
                        }
                )
        }
}

struct ProgressBar: View {
    var StepsNum: Int
    @Binding var CurrentStep: Int
    var body: some View {
        ZStack(){
            HStack(spacing: 16) {
                ForEach(0 ..< StepsNum, id: \.self) { item in
                    Rectangle()
                        .frame(height: 10)
                        .foregroundStyle(item <= CurrentStep ? .green : .gray)
                }
            }
            .frame(height: 50)
        }
    }
}

#Preview {
    OnboardingView(userName: "")
}
