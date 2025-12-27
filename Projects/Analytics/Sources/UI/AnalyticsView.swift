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
        PasswordCategory(label: "passwordCategorySecureLabel", value: 24, color: .green),
        PasswordCategory(label: "passwordCategoryWeakLabel", value: 26, color: .red)
    ]
    
    let value: Double = 0.48
    
    var body: some View {
        VStack {
            Text("developFeatureTextTitle")
        }
    }
}

#Preview {
    AnalyticsView()
}
