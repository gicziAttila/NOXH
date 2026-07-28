//
//  DateSelectView.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 07. 28..
//

import SwiftUI
struct DateSelectView: View {
    @ObservedObject var viewModel: DashboardViewModel
    var body: some View {
        HStack(spacing: 8) {
            Button(action: {
                viewModel.changeDate(by: -1)
            }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white.opacity(0.8))
                    .frame(width: 30, height: 30)
            }
            Text(viewModel.displayedDateText)
                .font(.system(size:14, weight: .bold))
                .textCase(.uppercase)
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color.white.opacity(0.15))
                .cornerRadius(8)
            Button(action: {
                viewModel.changeDate(by: 1)
            }) {
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white.opacity(0.8))
                    .frame(width: 30, height: 30)
                }
            }
            .padding(.horizontal, 8)
            .background(Color.white.opacity(0.05))
            .cornerRadius(12)
    }
}
