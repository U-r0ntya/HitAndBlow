import Foundation

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
