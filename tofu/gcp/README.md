# OpenTofu

IaC ツールとして、[OpenTofu](https://opentofu.org/)を採用する。

## Set Up

Mac の場合は以下のコマンドよりインストールする。

```bash
$ brew update
$ brew install opentofu
```

ローカル PC で実行する場合は以下のような`terraform.tfvars`を作成しておく。  
GitHub Actions で実行する場合は環境変数として変数の先頭に`TF_VAR_`を追加して宣言しておく。

`./prod/terraform.tfvars`:

```bash
APP_NAME              = "<YOUR APP NAME>"
GCP_PROJECT_NAME      = "<YOUR PROJECT NAME OF GCP>"
GCP_REAGION           = "<YOUR REGION>"
```

ローカル PC で実行する場合は以下のような`backend.tfvars`を作成しておく。  
GitHub Actions で実行する場合は環境変数として設定し、`tofu init`の際に変数として指定する。

`./prod/backend.tfvars`:

```bash
bucket  = "<THE BUCKET NAME OF STATE>"
prefix  = "<THE PREFIX OF STATE>"
```

以下のコマンドより tofu を実行する。  
ローカル PC で実行する場合は GCP の認証のために`gcloud auth application-default login`を実行しておく。  
※通常は GitHub Actions から自動実行するようにする。ローカルからの実行は緊急で無い限り plan までの実行に留めること。

```bash
$ cd tofu/gcp
$ tofu init --backend-config=prod/backend.tfvars
$ tofu plan -input=false -var-file=prod/terraform.tfvars
$ tofu apply -input=false -var-file=prod/terraform.tfvars -auto-approve
```

以下のコマンドよりリソースを削除する。

```bash
$ tofu destroy -var-file=prod/terraform.tfvars
```
