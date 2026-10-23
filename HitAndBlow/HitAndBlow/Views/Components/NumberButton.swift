//
//  NumberButton.swift
//  HitAndBlow
//
//  Created by うーろんちゃ_Mac on 2026/10/23.
//

import SwiftUI

struct NumberButton: View {
    var body: some View {
        Button {
            print("1")  // 4-2 で game.pressNumber(n) に変える
        } label: {
            Text("1")
                .font(
                    .custom(
                        "ShipporiMinchoB1-Bold",
                        size: 50
                    )
                )
                .offset(y: -4)  // 文字だけ上に 4 ずらす
                .foregroundStyle(Color("BackgroundColor"))
                .frame(width: 72, height: 72)
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

#Preview {
    NumberButton()
}
