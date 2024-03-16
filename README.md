# しゃなりしゃなり インフラストラクチャ

しゃなりしゃなりのインフラ部分を構築/管理する

# ローカル開発環境

![](img/local_development.drawio.svg)

以下の開発ツールを準備する

- [Visual Studio Code](https://azure.microsoft.com/ja-jp/products/visual-studio-code)
- [Docker Desktop](https://www.docker.com/ja-jp/products/personal/)
  - 個人開発のため
  - Kubernetes のプラグインを有効にする

## 実行手順

### 起動

以下のコマンドを実行してローカル PC 上の Kubernetes でアプリケーションを起動します。

```bash
$ kubectl apply -f local -R
```

`http://localhost`でアクセスできます。  
新しい Image を作成した場合は、各 deployment.yaml のバージョンを変更します。  
ToDo: 自動でバージョンを変更するか、実行時に引数として渡せるかの対応を検討する

### 停止

以下のコマンドを実行してローカル PC 上の Kubernetes でアプリケーションを停止します。

```bash
$ kubectl delete -f local -R
```
