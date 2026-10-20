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
    var cpuNum: ThreeDigits = ThreeDigits(first: 1, second: 2, third: 3)
    // プレイヤーが現時点で入力している値
    var inputDigits: [Int] = []
    // プレイヤーの履歴
    var history: [GuessEntry] = []
    // 処理

    // テスト出力
    print("gameState: \(gameState)")
    print("cpuNum: \(cpuNum.digits)")
    print("inputDigits: \(inputDigits)")
    print("history: \(history)")
}
