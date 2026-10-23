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
        VStack {
            ForEach(game.history.indices, id: \.self) { i in
                HistoryRow(round: i + 1, entry: game.history[i])
            }
        }
    }
}

