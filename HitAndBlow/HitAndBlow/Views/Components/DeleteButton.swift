//
//  DeleteButton.swift
//  HitAndBlow
//
//  Created by うーろんちゃ_Mac on 2026/10/23.
//

import SwiftUI

struct DeleteButton: View {
    var game: HitAndBlowViewModel
    var body: some View {
        Button {
            game.pressDelete()
        } label: {
            Image(systemName: "delete.left")
                .font(
                    .system(size: 30, weight: .semibold)
                )
                .foregroundStyle(
                    Color("OnHighlightColor")
                )
                .frame(width: 72, height: 60)
                .background(Color("HighlightColor"))
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
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


