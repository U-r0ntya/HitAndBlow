//
//  StartCrard.swift
//  HitAndBlow
//
//  Created by うーろんちゃ_Mac on 2026/10/24.
//

import SwiftUI

struct StartCard: View {
    var game: HitAndBlowViewModel

    var body: some View {
        VStack(spacing: 12) {
            Text("ようこそ！")
            Text("さっそくニューゲームをタップしてスタート！")
        }
        .frame(width: 300, height: 300)
        .background(Color("MainColor"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 4)
        .offset(y: -80)
    }
}
