//
//  CpuSection.swift
//  HitAndBlow
//
//  Created by うーろんちゃ_Mac on 2026/10/23.
//

import SwiftUI

struct CpuSection: View {
    var game: HitAndBlowViewModel
    var body: some View {
        VStack {
            HStack {
                Text("CPU")
                if game.isCleared {
                    Text("\(game.cpuNumber.digits[0])")
                    Text("\(game.cpuNumber.digits[1])")
                    Text("\(game.cpuNumber.digits[2])")
                } else {
                    Text("-")
                    Text("-")
                    Text("-")
                }

            }
        }
    }
}
