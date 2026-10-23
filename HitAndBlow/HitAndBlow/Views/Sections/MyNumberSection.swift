//
//  MyNumberSection.swift
//  HitAndBlow
//
//  Created by うーろんちゃ_Mac on 2026/10/23.
//

import SwiftUI

struct MyNumberSection: View {
    var body: some View {
        HStack(spacing: 36) {
            Text("1")
            Text("2")
            Text("3")
        }
        .font(.custom("ShipporiMinchoB1-Bold", size: 50))
    }
}

#Preview {
    MyNumberSection()
}
