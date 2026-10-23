//
//  ControlSection.swift
//  HitAndBlow
//
//  Created by うーろんちゃ_Mac on 2026/10/23.
//

import SwiftUI

struct ControlSection: View {
    var body: some View {
        VStack {
            // 数字ボタン
            NumberButton()
            HStack {
                // 決定ボタン
                DecideButton()
                // 削除ボタン
                DeleteButton()
            }
        }
    }
}

#Preview {
    ControlSection()
}
