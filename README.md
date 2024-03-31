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

# GCP 環境

![](img/gcp_environment.drawio.svg)
※把握できたら更新する

※Workflow+OpenTofu のみで現状セットアップが完了していないので、以下の追加対応をローカル PC から実施する。

1. GKE と認証する

   ```bash
   $ gcloud container clusters get-credentials <CLUSTER NAME> --region <REGION>     --project <PROJECT NAME>
   ```

1. ポートフォーワードの設定をする

   ```bash
   $ kubectl port-forward service/argo-cd-argocd-server -n argocd 8080:443
   ```

1. ArgoCD のパスワードを生成する

   ```bash
   kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.    password}" | base64 -d
   ```

1. `localhost:8080`でアクセスする。username は初期は`admin`、パスワードは上記で生成されたもの。
