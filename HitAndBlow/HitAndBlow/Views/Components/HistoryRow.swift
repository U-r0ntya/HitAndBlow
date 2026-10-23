//
//  HistoryRow.swift
//  HitAndBlow
//
//  Created by うーろんちゃ_Mac on 2026/10/23.
//

import SwiftUI

struct HistoryRow: View {
    var body: some View {
        HStack {
            Text("番号")
            Text("-ヒット")
            Text("-ブロー")
        }
    }
}

#Preview {
    HistoryRow()
}
