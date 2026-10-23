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
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: height * 0.1,
                                alignment: .center
                            )
                            .background(.red.opacity(0.3))  // 確認用（終わったら消す）

                        // --------------- 5：ゲーム画面
                        GameSection()
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: height * 0.5,
                                alignment: .top
                            )
                            .background(.blue.opacity(0.3))  // 確認用（終わったら消す）
                        // --------------- 1：番号表示
                        MyNumberSection()
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: height * 0.1,
                        )
                        .background(.orange.opacity(0.3))  // 確認用（終わったら消す）
                        // --------------- 3：ボタン
                        ControlSection()
                            .padding(12)
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: height * 0.3,
                                alignment: .top
                            )
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
