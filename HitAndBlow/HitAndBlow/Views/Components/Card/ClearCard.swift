//
//  ClearCard.swift
//  HitAndBlow
//
//  Created by うーろんちゃ_Mac on 2026/10/24.
//

import SwiftUI

struct ClearCard: View {
    var game: HitAndBlowViewModel

    var body: some View {
        VStack(spacing: 12) {
            Text("正解！")
            Text("\(game.history.count)回目でクリア")
        }
        .frame(width: 300, height: 300)
        .background(Color("MainColor"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 4)
        .offset(y: -80)
    }
}

#Preview {
    ClearCard(game: HitAndBlowViewModel())
}
