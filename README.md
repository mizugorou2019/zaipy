## アプリケーション名
Zaipy

## アプリケーション概要
効率的な在庫管理が可能となります。
印刷した在庫管理表では記入スペースが限られたり、修正に手間を取られたり、
更には急な在庫の変化が発生した際に正しく管理をする事が困難になる場面があるかと思います。
このアプリケーションであればそれらの問題を解決し、よりストレスフリーな在庫管理を可能にしてくれます。

## URL
https://zaipy.herokuapp.com/

## テスト用アカウント
ユーザー名：山田花子
パスワード：abc12345

## 利用方法
まずログインボタンをクリックし、ユーザー名とパスワードでログインします。
その後物資登録をクリックし、物資の写真、名称、詳細情報などを入力する事で物資の情報を登録できます。
登録後、物資の画像をクリックする事で、その物資の詳細情報をより分かりやすく確認できます。
その他、情報の編集や削除は発注担当以上の方のみが実行可能となります。

## 目指した課題解決
過去の洋菓子店での職務経験か、らこのアプリケーションの着想を得ました。
当時勤務した店舗では、印刷した紙の表を使って在庫管理をしていました。
しかし管理を開始して日にちが経つにつれ、記入者によっては数字の読み間違える(0を6、1を7と読み間違えるなど)、
劣化により紙が破ける、急な在庫の変化があった際に正確な個数の把握が困難となる、といった場面が多々ありました。
そんな在庫管理でのトラブルを解決できるアプリがあれば、という当時の考えから、このアプリを開発するに至りました。

## 洗い出した要件
| 機能          | 目的    | 詳細         |
| ------------ | ------- | ----------- |
| ユーザー登録 |	社員の情報を登録できます。 |	名前、フリガナ、電話番号、パスワードを入力して登録し、zaipy使用時のアカウントを作成できます。なお現状、1番目・2番目に登録したユーザーのみが、在庫の登録・編集全般・削除の権限を持ちます。 |
| 在庫情報登録 | バックヤードの資材を登録します。 |	資材の外見画像、名前、カテゴリーなどを登録し、登録後はトップページでそのリストを確認できます(ログイン時のみ)。 |
| 在庫情報一覧 | バックヤードの資材の情報を閲覧できます。(ログイン時のみ) | 登録された資材の大まかな情報を確認できます。|
| 在庫情報詳細 |	資材の情報をより詳細に閲覧できます。 | 資材の画像をクリックすることで、その資材の画像を拡大し、尚且つその他の情報を閲覧できます。 |
| 在庫情報編集 | 資材の情報を編集できます。 | 一度登録された資材の情報を編集できます。また物資の個数のみ、発注担当未満の方でも変更できます。 |
| 在庫情報削除 | 資材の情報を削除できます。 | 期間限定の箱など、通年では使わない資材の情報を削除できます。この機能は発注担当以上の方のみが実行できます。 |


## 使用例
<img width="1018" alt="スクリーンショット 2020-11-20 2 20 25" src="https://user-images.githubusercontent.com/52431751/99701020-43dfae80-2ad7-11eb-97a6-7f6a1d0cce9e.png">

## 実装予定の機能
| 機能          | 目的    | 詳細         |
| ------------ | ------- | ----------- |
| 発注チャット画面 | 不足した資材を資材担当部署へ発注を依頼します。 | 在庫数が残り少ない資材をチャット画面でリストアップし、資材担当部署へ発注を依頼します。非同期通信でのチャットになっているため、比較的迅速に相手側からのメッセージが確認できます。 |

## ローカルでの動作方法
git cloneを行ってください。

Ruby on Rails 6.0.0

## Users テーブル
| Column     | Type    | Options     |
| ---------- | ------  | ----------- |
| name       | string  | null: false |
| name_kana  | string  | null: false |
| tel_num    | string  | null: false |
| password   | string  | null: false |

### Association
- has_many :orders


## Items テーブル
| Column        | Type    | Options       |
| ------------- | ------- | ------------- |
| name          | string  | null: false   |
| description   | text    | null: false   |
| quantity      | integer | null: false   |
| category_id   | integer | null: false   |

### Association
- has_one :order


## Orders テーブル
| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| user_id         | integer | null: false, foreign_key: true |
| item_id         | integer | null: false, foreign_key: true |
| quantity        | integer | null: false                    |

### Association
- belongs_to :user
- belongs_to :item
