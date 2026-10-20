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
    var cpuNum: ThreeDigits = createCpuNum()
    // プレイヤーが現時点で入力している値
    var inputDigits: [Int] = []
    // プレイヤーの履歴
    var history: [GuessEntry] = []

    // -- 処理 --
    // 重複しないランダムな三桁の数値を設定
    func createCpuNum() -> ThreeDigits {
        var allNumbers: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        var picked: [Int] = []
        while picked.count < 3 {
            let index = Int.random(in: 0..<allNumbers.count)
            let pick = allNumbers.remove(at: index)
            picked.append(pick)
        }
        return ThreeDigits(
            first: picked[0],
            second: picked[1],
            third: picked[2]
        )
    }

    // テスト出力
    print("gameState: \(gameState)")
    print("cpuNum: \(cpuNum.digits)")
    print("inputDigits: \(inputDigits)")
    print("history: \(history)")
    
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
}
