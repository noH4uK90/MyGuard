//
//  AnalyticsView.swift
//  MyGuard
//
//  Created by Иван Спирин on 26.06.2025.
//

import SwiftUI
import Charts

struct PasswordCategory: Identifiable {
    let id = UUID()
    let label: String
    let value: Int
    let color: Color
}

struct AnalyticsView: View {
    let data: [PasswordCategory] = [
        PasswordCategory(label: "Безопасный", value: 24, color: .green),
        PasswordCategory(label: "Слабый", value: 26, color: .red)
    ]
    
    let value: Double = 0.48
    
    var body: some View {
        ScrollView {
            VStack {
                Gauge(value: value) {
                    Text("Безопасность")
                } currentValueLabel: {
                    Text("\(Int(value * 100))%")
                }
                .gaugeStyle(.accessoryLinearCapacity)
                .tint(value < 0.5 ? .red : (value < 0.8 ? .orange : .green))
                .frame(width: 200, height: 200)
                
                Chart {
                    ForEach(data, id: \.id) { password in
                        SectorMark(
                            angle: .value("Password", password.value),
                            innerRadius: .ratio(0.6),
                            angularInset: 2
                        )
                        .foregroundStyle(password.color)
                        .cornerRadius(10.0)
                        .annotation(position: .overlay) {
                            Text("\(password.value)")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AnalyticsView()
}
