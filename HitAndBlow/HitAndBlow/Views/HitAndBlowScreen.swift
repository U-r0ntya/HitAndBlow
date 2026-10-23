import SwiftUI

struct HitAndBlowScreen: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                GeometryReader { geometry in
                    let height = geometry.size.height  // 使える高さ

                    VStack(spacing: 0) {
                        // --------------- 1：CPU
                        CpuSection()
                        .frame(maxWidth: .infinity)
                        .frame(height: height * 0.1)
                        .background(.red.opacity(0.3))  // 確認用（終わったら消す）

                        // --------------- 5：ゲーム画面
                        GameSection()
                        .frame(maxWidth: .infinity)
                        .frame(height: height * 0.5)
                        .background(.blue.opacity(0.3))  // 確認用（終わったら消す）

                        // --------------- 4：ボタン
                        ControlSection()
                        .frame(maxWidth: .infinity)
                        .frame(height: height * 0.4)
                        .background(.yellow.opacity(0.3))  // 確認用（終わったら消す）
                    }
                }
            }
            .foregroundStyle(Color("TextColor"))
            .font(.custom("ShipporiMinchoB1-Bold", size: 34))
            .navigationTitle("ヒット＆ブロー")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color("TextColor"), for: .navigationBar)  // バーの背景色
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview("ライト") {
    HitAndBlowScreen()
}

#Preview("ダーク") {
    HitAndBlowScreen()
        .preferredColorScheme(.dark)
}
