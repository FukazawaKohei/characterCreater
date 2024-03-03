# キャラクタークリエイター

シンプルなキャラクター生成/管理機能アプリです。

|                   一覧                    |                 新規作成                 |                   編集                    |
| :---------------------------------------: | :--------------------------------------: | :---------------------------------------: |
| <img src="image/list.png" height="300em"> | <img src="image/new.png" height="300em"> | <img src="image/edit.png" height="300em"> |

技術検証のため色々なライブラリを試しつつ、最適なアーキテクチャを考えながら作成してみました。

## 【技術スタック】

 - flutter v3.19.0
 - go_router v13.1.0
 - sqflite v2.3.2
 - freezed v2.4.1
 - flutter_riverpod v2.4.10
 - flutter_hooks v0.20.5

## 【ビルド関連】

 - パッケージのインストール
```
flutter pub get
```

 - freezed and riverpod build_runner （再生成用）
```
flutter pub run build_runner build --delete-conflicting-outputs
```