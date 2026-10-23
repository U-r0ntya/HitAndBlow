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
                        // --------------- 5：ゲーム画面
                        GameSection()
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: height * 0.5,
                                alignment: .top
                            )
                        // --------------- 1：番号表示
                        MyNumberSection()
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: height * 0.1,
                            )
                        // --------------- 3：ボタン
                        ControlSection()
                            .padding(12)
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: height * 0.3,
                                alignment: .top
                            )
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
