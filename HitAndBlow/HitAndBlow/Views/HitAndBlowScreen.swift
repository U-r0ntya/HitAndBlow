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
                        VStack {
                            HStack {
                                Text("CPU")
                                Text("-")
                                Text("-")
                                Text("-")
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: height * 0.1)
                        .background(.red.opacity(0.3))  // 確認用（終わったら消す）

                        // --------------- 5：ゲーム画面
                        VStack {
                            Text("ゲーム画面")
                            HStack {
                                Text("-")
                                Text("-")
                                Text("-")
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: height * 0.5)
                        .background(.blue.opacity(0.3))  // 確認用（終わったら消す）

                        // --------------- 4：ボタン
                        VStack {
                            // 数字ボタン
                            Button {
                                print("1")  // 4-2 で game.pressNumber(n) に変える
                            } label: {
                                Text("1")
                                    .font(
                                        .custom(
                                            "ShipporiMinchoB1-Bold",
                                            size: 50
                                        )
                                    )
                                    .offset(y: -4)  // 文字だけ上に 4 ずらす
                                    .foregroundStyle(Color("BackgroundColor"))
                                    .frame(width: 72, height: 72)
                                    .background(Color("TextColor"))
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 16)
                                    )
                                    .shadow(
                                        color: .black.opacity(0.2),
                                        radius: 4,
                                        x: 0,
                                        y: 2
                                    )
                            }
                            HStack {
                                // 決定ボタン
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
                                // 削除ボタン
                                Button {
                                    print("削除")  // 4-2 で game.pressDelete() に変える
                                } label: {
                                    Image(systemName: "delete.left")
                                        .font(
                                            .system(size: 24, weight: .semibold)
                                        )
                                        .foregroundStyle(
                                            Color("OnHighlightColor")
                                        )
                                        .frame(width: 60, height: 50)
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
