//
//  ControlSection.swift
//  HitAndBlow
//
//  Created by うーろんちゃ_Mac on 2026/10/23.
//

import SwiftUI

struct ControlSection: View {
    var game: HitAndBlowViewModel
    var body: some View {
        VStack {
            // 数字ボタン
            VStack(spacing: 12) {
                ForEach([[0, 1, 2, 3, 4], [5, 6, 7, 8, 9]], id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { n in
                            NumberButton(number: n, game: game)
                        }
                    }
                }
            }
            HStack {
                // 決定ボタン
                DecideButton(game: game)
                // 削除ボタン
                DeleteButton(game: game)
            }
        }
    }
}
