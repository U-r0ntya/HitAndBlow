import Foundation
import Playgrounds

#Playground {
    // -- 型 --
    // ゲーム状態
    enum GameState {
        case nowGame
        case finishGame
    }

    // -- 構造体 --
    // 三桁の数字
    struct ThreeDigits {
        var first: Int
        var second: Int
        var third: Int

        var digits: [Int] {
            [first, second, third]
        }
    }
    // 履歴記録（入力した三桁、ヒット数、ブロウ数）
    struct GuessEntry {
        let digits: [Int]
        let hit: Int
        let blow: Int
    }

    // -- データ（値や状態を保持する）--
    // ゲームの状態、初期状態はゲーム終了状態
    var gameState: GameState = .finishGame
    // CPUの持つ値
    var cpuNumber: ThreeDigits = createCpuNum()
    // プレイヤーが現時点で入力している値
    var inputDigits: [Int] = []
    // プレイヤーの履歴
    var history: [GuessEntry] = []

    // -- 処理 --
    // 重複しないランダムな三桁の数値を設定
    func createCpuNum() -> ThreeDigits {
        var allNumbers: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        var picked: [Int] = []  // 乱数を収納
        while picked.count < 3 {
            let index = Int.random(in: 0..<allNumbers.count)  // ０から配列の数（９）までの乱数を与え
            let pick = allNumbers.remove(at: index)  //　与えられた乱数を配列から取り出す
            picked.append(pick)  // それを格納
        }
        return ThreeDigits(
            first: picked[0],
            second: picked[1],
            third: picked[2]
        )
    }

    // 一つの値を受け取り、inputDigitsに格納する処理
    func pressNumber(_ num: Int) {
        // ゲーム中かつ、配列の数が３少ないかつ、配列の中にすでにある番号でない
        if gameState == .nowGame && inputDigits.count < 3
            && !inputDigits.contains(num)
        {
            inputDigits.append(num)
        } else {
            return
        }
    }

    // 最新に格納した値を一つ消す処理
    func pressDelete() {
        // ゲーム中かつ、配列の数が0より大きい
        if gameState == .nowGame && inputDigits.count > 0 {
            inputDigits.removeLast()  // 最後(最新)の値を消す
        } else {
            return
        }
    }

    func pressDecide() {
        var hit: Int = 0
        var blow: Int = 0

        // ゲーム中かつ、現時点の入力が三つ格納されている
        guard gameState == .nowGame else {
            return
        }
        guard inputDigits.count == 3 else {
            print("数字は三つ選択せれていません")
            return
        }

        // 比較し加算する
        for n in inputDigits.indices {
            // 数字と位置の両方が一致していれば
            if cpuNumber.digits[n] == inputDigits[n] {
                hit += 1
                // 数字は答えに含まれている
            } else if cpuNumber.digits.contains(inputDigits[n]) {
                blow += 1
            }
        }
        // 履歴に格納
        history.append(GuessEntry(digits: inputDigits, hit: hit, blow: blow))
        // ３ヒットならば
        if hit == 3 {
            gameState == .finishGame
            print("正解！ \(history.count)回目でクリア")
        }
        // 仮
        for entry in history {
            print("\(entry.digits) \(entry.hit)ヒット \(entry.blow)ブロー")
        }
        
        // からにする
        inputDigits = []
    }

    // テスト出力

    // step/2-1-models
    print("--  step/2-1-models --")
    print("gameState: \(gameState)")
    print("cpuNum: \(cpuNumber.digits)")
    print("inputDigits: \(inputDigits)")
    print("history: \(history)")

    // step/2-2-answer
    print("--  step/2-2-answer --")
    var ok = true
    for _ in 1...100 {
        let n = createCpuNum()
        let d = n.digits

        if d[0] == d[1] || d[0] == d[2] || d[1] == d[2] {
            print("重複あり：\(d)")
            ok = false
        }
    }
    print(ok ? "100回とも重複なし" : "失敗")

    // step/2-3-input

    // pressNumber test
    print("--  step/2-3-input --")
    gameState = .nowGame
    pressNumber(1)
    pressNumber(1)
    pressNumber(2)
    pressNumber(3)
    pressNumber(4)
    print("inputDigits: \(inputDigits)")
    // pressDelete test
    pressDelete()
    print("inputDigits: \(inputDigits)")
    inputDigits = []
    gameState = .finishGame

    // step/2-4-decide
    print("--  step/2-4-decide --")
    gameState = .nowGame
    (cpuNumber.first,cpuNumber.second,cpuNumber.third) = (3,7,1)
    print("cpuNum: \(cpuNumber.digits)")
    pressNumber(4)
    pressNumber(5)
    pressNumber(6)
    pressDecide()
    pressNumber(1)
    pressNumber(2)
    pressNumber(3)
    pressDecide()
    pressNumber(7)
    pressNumber(1)
    pressNumber(3)
    pressDecide()
    pressNumber(3)
    pressNumber(9)
    pressNumber(1)
    pressDecide()
    pressNumber(3)
    pressNumber(1)
    pressNumber(7)
    pressDecide()
    pressNumber(3)
    pressNumber(7)
    pressNumber(1)
    pressDecide()
}
