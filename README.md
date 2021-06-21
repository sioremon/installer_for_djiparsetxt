# installer for djiparsetxt
djiparsetxtのmac用インストーラです. 依存関係もまとめて解決するのでこいつを走らせればおk. bash/zshに対応. 
CLIの操作に慣れてない人向けに書いています. 

## macユーザの方
- ターミナルを開いてこのプロジェクトをダウンロードしたディレクトリまで移動します. ダウンロードフォルダに落とした場合は以下のコマンドを実行します.
    - ```cd Downloads/installer_djiparsetxt```
- ```ls```コマンドを実行し```chech.sh```があることを確認して以下のコマンド
    - ```chmod 755 ./check.sh```を実行(このコマンドでインストーラが実行出来るようになります)
- そのまま同じディレクトリ内で
    - ```source ./check.sh```を実行
- かなり時間がかかる可能性があります. 処理が止まっているように見えますが実は動いているのでそのまま終わるまで放置してください. 

- ```install finished!!!```と表示されたら終了です. 

## 使い方
- DJIのフライトログ(TXT形式)を読み込ませます. 以下の```/path/to/file.TXT```は読み込ませたいファイルまでのパスを書いてください.
```log2csv path/to/file.TXT```

    
