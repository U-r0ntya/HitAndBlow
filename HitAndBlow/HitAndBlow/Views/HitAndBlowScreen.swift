import SwiftUI

struct HitAndBlowScreen: View {
    @State private var game = HitAndBlowViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundColor")   // 一番奥：背景
                    .ignoresSafeArea()
                GeometryReader { geometry in   // 真ん中：今の画面
                    let height = geometry.size.height  // 使える高さ

                    VStack(spacing: 0) {
                        // --------------- 1：CPU
                        CpuSection(game: game)
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: height * 0.1,
                                alignment: .center
                            )
                        // --------------- 5：ゲーム画面
                        GameSection(game: game)
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: height * 0.5,
                                alignment: .top
                            )
                        // --------------- 1：番号表示
                        MyNumberSection(game: game)
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: height * 0.1,
                            )
                        // --------------- 3：ボタン
                        ControlSection(game: game)
                            .padding(12)
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: height * 0.3,
                                alignment: .top
                            )
                    }
                }
                if game.isCleared {            // 一番手前：クリアの表示
                       ClearCard(game: game)
                   }
                if game.isStart {            // 一番手前：クリアの表示
                       StartCrard(game: game)
                   }
            }
            .foregroundStyle(Color("TextColor"))
            .font(.custom("ShipporiMinchoB1-Bold", size: 34))
            .navigationTitle("ヒット＆ブロー")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color("TextColor"), for: .navigationBar)  // バーの背景色
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("ニューゲーム") {
                        game.newGame()
                    }.foregroundStyle(Color("BackgroundColor"))
                        .font(.custom("ShipporiMinchoB1-Bold", size: 25))
                }
            }

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
