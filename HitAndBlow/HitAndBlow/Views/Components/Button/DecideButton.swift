//
//  DecideButton.swift
//  HitAndBlow
//
//  Created by うーろんちゃ_Mac on 2026/10/23.
//

import SwiftUI

struct DecideButton: View {
    var game: HitAndBlowViewModel
    var body: some View {
        Button {
            game.pressDecide()
        } label: {
            Text("決定")
                .font(
                    .custom(
                        "ShipporiMinchoB1-Bold",
                        size: 30
                    )
                )
                .foregroundStyle(
                    Color("BackgroundColor")
                )
                .offset(y: -3)  // 文字だけ上に 4 ずらす
                .frame(width: 120, height: 60)
                .background(Color("MainColor"))
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
                .shadow(
                    color: .black.opacity(0.2),
                    radius: 4,
                    x: 0,
                    y: 2
                )
        }.disabled(!game.canDecide)
            .opacity(game.canDecide ? 1 : 0.4)
    }
}
