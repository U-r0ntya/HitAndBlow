//
//  NumberButton.swift
//  HitAndBlow
//
//  Created by うーろんちゃ_Mac on 2026/10/23.
//

import SwiftUI

struct NumberButton: View {
    let number: Int
    var game: HitAndBlowViewModel
    
    var body: some View {
        Button {
            game.pressNumber(number)  
        } label: {
            Text("\(number)")
                .font(
                    .custom(
                        "ShipporiMinchoB1-Bold",
                        size: 45
                    )
                )
                .offset(y: -4)  // 文字だけ上に 4 ずらす
                .foregroundStyle(Color("BackgroundColor"))
                .frame(width: 60, height: 60)
                .background(Color("TextColor"))
                .clipShape(
                    RoundedRectangle(cornerRadius: 16)
                )
                .shadow(
                    color: .black.opacity(0.2),
                    radius: 4,
                    x: 0,
                    y: 2
                )
        }
    }
}
