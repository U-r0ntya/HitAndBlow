// テスト出力

import Playgrounds

#Playground {
    let game = HitAndBlowViewModel()  // 箱を1つ作る

    // 結果を OK / NG で表示する
    func check(_ title: String, _ result: Bool) {
        print(result ? "OK" : "NG", title)
    }

    // 数字をまとめて入力する
    func input(_ nums: [Int]) {
        for n in nums {
            game.pressNumber(n)
        }
    }

    print("--- 3-1 想定外のケース ---")

    // 1. 開いた直後（ニューゲーム前）
    input([1, 2, 3])
    game.pressDelete()
    game.pressDecide()
    check("1. 開いた直後は押せない", game.inputDigits.isEmpty && game.history.isEmpty)

    // 2. 1 → 1
    game.newGame()
    input([1, 1])
    check("2. 同じ数字は押せない", game.inputDigits == [1])

    // 3. 1 → 2 → 3 → 4
    game.newGame()
    input([1, 2, 3, 4])
    check("3. 4つ目は無視される", game.inputDigits == [1, 2, 3])

    // 4. 1 → 2 → 決定
    game.newGame()
    input([1, 2])
    game.pressDecide()
    check(
        "4. 3桁未満では決定できない",
        game.history.isEmpty && game.inputDigits == [1, 2]
    )

    // 5. 空で削除
    game.newGame()
    game.pressDelete()
    check("5. 空のとき削除しても何も起きない", game.inputDigits.isEmpty)

    // 6. 正解後に数字・決定
    game.newGame()
    game.cpuNumber = ThreeDigits(first: 3, second: 7, third: 1)
    input([3, 7, 1])
    game.pressDecide()
    input([5])
    game.pressDecide()
    check(
        "6. 正解後は押せない",
        game.gameState == .finishGame && game.inputDigits.isEmpty
            && game.history.count == 1
    )

    // 7. 同じ予想を2回
    game.newGame()
    game.cpuNumber = ThreeDigits(first: 3, second: 7, third: 1)
    input([1, 2, 3])
    game.pressDecide()
    input([1, 2, 3])
    game.pressDecide()
    check("7. 同じ予想も受け付けて回数に数える", game.history.count == 2)

    // 8. 途中でニューゲーム
    game.newGame()
    input([1, 2, 3])
    game.pressDecide()
    input([4])
    game.newGame()
    check(
        "8. 途中のニューゲームで全部リセット",
        game.history.isEmpty && game.inputDigits.isEmpty
            && game.gameState == .nowGame
    )
}
