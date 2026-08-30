//
//  DatasView.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 08. 30..
//

import SwiftUI
struct MetricItem: Identifiable {
    let id = UUID()
    var title: String
    var unit: String
    var config: RulerPicker.Config
    var value: CGFloat
}
struct DatasView: View {
    @Binding var metrics: [MetricItem]
    @Binding var gender: String
    var onNext: () -> Void
    var body: some View {
        VStack {
            ForEach(0 ..< metrics.count, id: \.self) { index in
                VStack(spacing: 5) {
                    Text(metrics[index].title)
                        .font(.headline)
                        .foregroundStyle(.gray)
                        .kerning(2)
                    
                    HStack(alignment: .lastTextBaseline, spacing: 5) {
                        Text(verbatim: "\(Int(metrics[index].value))")
                            .font(.system(size: 50, weight: .bold))
                            .contentTransition(.numericText(value: metrics[index].value))
                            .animation(.snappy, value: metrics[index].value)
                            .foregroundStyle(.white)
                        
                        Text(metrics[index].unit)
                            .font(.title3)
                            .foregroundStyle(.gray)
                    }
                    
                    RulerPicker(config: metrics[index].config, value: $metrics[index].value)
                        .frame(height: 60)
                }
            }
            GlassEffectContainer(spacing: 10) {
                HStack(spacing: 15) {
                    ForEach(["MALE", "FEMALE"], id: \.self) { option in
                        Button(action: {
                            withAnimation { gender = option }
                        }) {
                            Text(option)
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    Capsule()
                                        .fill(gender == option ? Color.green : Color.clear)
                                )
                                .foregroundStyle(gender == option ? .white : .gray)
                        }
                        .glassEffect(.regular.interactive(), in: .capsule)
                    }
                }
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 20)
            Button(action: {
                onNext()
            }, label: {
                Text("next")
                    .font(.headline)
                    .textCase(.uppercase)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.green)
                    .cornerRadius(12)
            })
        }
    }
}

#Preview {
    OnboardingView(userName: "")
}
