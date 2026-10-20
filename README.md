# ## 9. ロードマップ

ブランチ：`feature/hit-and-blow` を親にして、各ステップのブランチを作る。
ステップが終わったら親にマージし、次のステップは親から作る。

- [x] フェーズ0：準備（リポジトリ、ブランチ、要件定義）
- [x] フェーズ1：設計

### フェーズ2：ロジックを Playground で作る
- [ ] 2-1 型とデータの土台 `step/2-1-models`
  - GameState、ThreeDigits、GuessEntry と、4つのデータ（gameState、cpuNum、inputDigits、history）を作る
  - 完了：エラーなくビルドでき、初期値を print で確認できる
- [ ] 2-2 答えを作る `step/2-2-answer`
  - createCpuNum
  - 完了：7の「答えの作成」（100回作って全部3桁・重複なし）
- [ ] 2-3 予想の入力 `step/2-3-input`
  - pressNumber、pressDelete
  - 完了：7の「操作」のうち、入力と削除に関するテストが通る
- [ ] 2-4 決定と判定 `step/2-4-decide`
  - pressDecide（比較、履歴への記録、3ヒットで終了、入力を空に戻す）
  - 完了：cpuNum を 371 にして、7の「判定」の表が全部正しく出る
- [ ] 2-5 ゲームの進行 `step/2-5-game-flow`
  - newGame、displayResult
  - 完了：print だけで最初から正解まで1ゲーム遊べる。正解後のニューゲームでリセットされる
- [ ] 2-6 想定外のケースの確認 `step/2-6-edge-cases`
  - 完了：6の表を全部試して、決めたとおりに動く

### フェーズ3：ロジックをアプリ用のファイルに移す
- [ ] 3-1 ロジックの移動 `step/3-1-move-logic`
  - 完了：移したあともフェーズ2のテストが同じ結果になる

### フェーズ4：画面（SwiftUI）を作る
- [ ] 4-1 見た目だけ作る `step/4-1-layout`
- [ ] 4-2 数字ボタンと入力中の表示 `step/4-2-input-ui`
- [ ] 4-3 決定・結果・履歴の表示 `step/4-3-result-ui`
- [ ] 4-4 ボタンを押せる・押せないの切り替え `step/4-4-button-state`
- [ ] 4-5 正解の表示とニューゲーム `step/4-5-clear-ui`

### フェーズ5：仕上げ
- [ ] 5-1 シミュレーターで7を全部確認、README 更新 `step/5-1-finish`
- [ ] `feature/hit-and-blow` を `main` にマージ
