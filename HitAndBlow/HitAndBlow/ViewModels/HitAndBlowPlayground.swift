import Playgrounds

#Playground("判定") {
    let game = HitAndBlowViewModel()

    // 結果を OK / NG で表示する
    func check(_ title: String, _ result: Bool) {
        print(result ? "OK" : "NG", title)
    }

    print("--- 判定（答えが 371 の場合）---")

    // ゲームを始めて、答えを 371 にする
    game.newGame()
    game.cpuNumber = ThreeDigits(first: 3, second: 7, third: 1)

    // README の表：予想、期待するヒット数、期待するブロー数
    let cases: [(guess: [Int], hit: Int, blow: Int)] = [
        ([4, 5, 6], 0, 0),
        ([1, 2, 3], 0, 2),
        ([7, 1, 3], 0, 3),
        ([3, 9, 1], 2, 0),
        ([3, 1, 7], 1, 2),
        ([3, 7, 1], 3, 0),
    ]

    for c in cases {
        // 3つの数字を入力して決定する
        for n in c.guess {
            game.pressNumber(n)
        }
        game.pressDecide()

        // 最後に記録された結果を確かめる
        if let last = game.history.last {
            let ok = last.digits == c.guess && last.hit == c.hit && last.blow == c.blow
            check("\(c.guess) → \(last.hit)ヒット \(last.blow)ブロー（期待：\(c.hit)ヒット \(c.blow)ブロー）", ok)
        } else {
            check("\(c.guess) → 記録されていない", false)
        }
    }

    // 371 で正解になっているか
    check("371 でクリアになる", game.isCleared)
    check("6回目でクリア", game.history.count == 6)
}
