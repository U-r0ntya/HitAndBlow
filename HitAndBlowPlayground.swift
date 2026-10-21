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
        }
    }
    
    // 最新に格納した値を一つ消す処理
    func pressDelete() {
        // ゲーム中かつ、配列の数が0より大きい
        if gameState == .nowGame && inputDigits.count > 0 {
            inputDigits.removeLast()  // 最後(最新)の値を消す
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
            gameState = .finishGame
            print("正解！ \(history.count)回目でクリア")
        }
        // 仮
        for entry in history {
            print("\(entry.digits) \(entry.hit)ヒット \(entry.blow)ブロー")
        }
        // からにする
        inputDigits = []
    }
    
    func newGame() {
        gameState = .nowGame
        cpuNumber = createCpuNum()
        history = []
        inputDigits = []
    }
    
    func displayResult() {
        for entry in history {
            print("\(entry.digits) \(entry.hit)ヒット \(entry.blow)ブロー")
        }
    }
    
    // テスト出力

    // 結果を OK / NG で表示する
    func check(_ title: String, _ result: Bool) {
        print(result ? "OK" : "NG", title)
    }

    // 数字をまとめて入力する
    func input(_ nums: [Int]) {
        for n in nums {
            pressNumber(n)
        }
    }

    print("--- 2-6 想定外のケース ---")

    // 1. 開いた直後（ニューゲーム前）に数字・削除・決定を押す
    //    ※ 必ず一番最初に実行する（newGame より前）
    input([1, 2, 3])
    pressDelete()
    pressDecide()
    check("1. 開いた直後は押せない", inputDigits.isEmpty && history.isEmpty)

    // 2. すでに入力した数字を押す（1 → 1）
    newGame()
    input([1, 1])
    check("2. 同じ数字は押せない", inputDigits == [1])

    // 3. 3桁入力したあとに、さらに数字を押す（1 → 2 → 3 → 4）
    newGame()
    input([1, 2, 3, 4])
    check("3. 4つ目は無視される", inputDigits == [1, 2, 3])

    // 4. 3桁そろっていないのに決定を押す（1 → 2 → 決定）
    newGame()
    input([1, 2])
    pressDecide()
    check("4. 3桁未満では決定できない", history.isEmpty && inputDigits == [1, 2])

    // 5. 何も入力していないのに削除を押す
    newGame()
    pressDelete()
    check("5. 空のとき削除しても何も起きない", inputDigits.isEmpty)

    // 6. 正解したあとに数字・決定を押す
    newGame()
    cpuNumber = ThreeDigits(first: 3, second: 7, third: 1)
    input([3, 7, 1])
    pressDecide()
    input([5])
    pressDecide()
    check("6. 正解後は押せない", gameState == .finishGame && inputDigits.isEmpty && history.count == 1)

    // 7. 前と同じ予想をもう一度決定する
    newGame()
    cpuNumber = ThreeDigits(first: 3, second: 7, third: 1)
    input([1, 2, 3])
    pressDecide()
    input([1, 2, 3])
    pressDecide()
    check("7. 同じ予想も受け付けて回数に数える", history.count == 2)

    // 8. ゲームの途中でニューゲームを押す
    newGame()
    input([1, 2, 3])
    pressDecide()
    input([4])
    newGame()
    check("8. 途中のニューゲームで全部リセット", history.isEmpty && inputDigits.isEmpty && gameState == .nowGame)
}
