//
//  MyNumberSection.swift
//  HitAndBlow
//
//  Created by うーろんちゃ_Mac on 2026/10/23.
//

import SwiftUI

struct MyNumberSection: View {
    var game: HitAndBlowViewModel

    var body: some View {
        HStack(spacing: 36) {
            ForEach(0..<3, id: \.self) { index in
                Text(digitText(index))
            }
        }
        .font(.custom("ShipporiMinchoB1-Bold", size: 50))
    }

    // index 番目の数字を文字で返す。まだ入力されていなければ「-」
    func digitText(_ index: Int) -> String {
        if index < game.inputDigits.count {
            return "\(game.inputDigits[index])"
        } else {
            return "-"
        }
    }
}
