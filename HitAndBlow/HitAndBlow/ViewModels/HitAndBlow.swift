import Foundation

@Observable
class HitAndBlowViewModel {
    // -- データ（値や状態を保持する）--
    // ゲームの状態、初期状態はゲーム終了状態
    var gameState: GameState = .finishGame
    // CPUの持つ値
    var cpuNumber: ThreeDigits = HitAndBlowViewModel.createCpuNum()
    // プレイヤーが現時点で入力している値
    var inputDigits: [Int] = []
    // プレイヤーの履歴
    var history: [GuessEntry] = []

    // -- 処理 --
    // 重複しないランダムな三桁の数値を設定
    static func createCpuNum() -> ThreeDigits {
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
    
    // 決定ボタンを押したときの処理
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
        cpuNumber = HitAndBlowViewModel.createCpuNum()
        history = []
        inputDigits = []
    }

    func displayResult() {
        for entry in history {
            print("\(entry.digits) \(entry.hit)ヒット \(entry.blow)ブロー")
        }
    }
}
