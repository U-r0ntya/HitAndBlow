//
//  GameSection.swift
//  HitAndBlow
//
//  Created by うーろんちゃ_Mac on 2026/10/23.
//

import SwiftUI

struct GameSection: View {
    var game: HitAndBlowViewModel

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack {
                    ForEach(game.history.indices, id: \.self) { i in
                        HistoryRow(round: i + 1, entry: game.history[i])
                            .id(i)   // 行ごとに名札を付ける
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .onChange(of: game.history.count) {
                // 履歴の数が変わったら、最後の行までスクロールする
                if let last = game.history.indices.last {
                    withAnimation {
                        proxy.scrollTo(last, anchor: .bottom)
                    }
                }
            }
        }
    }
}
