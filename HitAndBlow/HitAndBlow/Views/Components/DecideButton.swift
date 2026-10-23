//
//  DecideButton.swift
//  HitAndBlow
//
//  Created by うーろんちゃ_Mac on 2026/10/23.
//

import SwiftUI

struct DecideButton: View {
    var body: some View {
        Button {
            print("決定")
        } label: {
            Text("決定")
                .font(
                    .custom(
                        "ShipporiMinchoB1-Bold",
                        size: 24
                    )
                )
                .foregroundStyle(
                    Color("BackgroundColor")
                )
                .frame(width: 120, height: 50)
                .background(Color("MainColor"))
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

#Preview {
    DecideButton()
}
