//
//  HistoryRow.swift
//  HitAndBlow
//
//  Created by うーろんちゃ_Mac on 2026/10/23.
//

import SwiftUI

struct HistoryRow: View {
    let round: Int          // 何回目か
    let entry: GuessEntry   // その回の記録

    var body: some View {
        HStack {
            Text("\(round).")
            Text(entry.digits.map { String($0) }.joined())
            Text("\(entry.hit)ヒット")
            Text("\(entry.blow)ブロー")
        }
    }
}

#Preview {
    HistoryRow(round: 1, entry: GuessEntry(digits: [3, 1, 7], hit: 1, blow: 2))
}
