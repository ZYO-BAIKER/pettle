# README

# アプリケーション名　
pettle

# アプリケーション概要
ペットを飼っている人同士を結ぶ
コミュニケーションツール

# URL

# テスト用アカウント

# 利用方法

# 目指した課題解決
愛するペットをSNSで自慢しても、承認欲求が満たされるのは
飼い主だけ。ペット自身も友達が欲しいはず。
近所でペットを飼っている人を探して、飼い主同士と
ペット同士が友達となれる。

# 洗い出した要件
・ユーザー管理機能
新規登録、編集、ログイン・ログアウト・退会（アカウント削除）が可能

・ペット紹介機能
名前、画像、紹介文、性別、動物の種類、住んでる地域を投稿できる。

・コメント機能
ペット紹介画面にコメントを投稿できる。

・ダイレクトメッセージ機能
気になった人に会う約束などするためのチャット機能。

# 実装した機能についてのGIFと説明

# 実装予定の機能

# テーブル設計

## users テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| nickname | string  | null: false |
| email    | string  | null: false |
| password | string  | null: false |
| sex_id   | integer | null: false |
| age_id   | integer | null: false | 

- has_many :pets
- has_many :comments
- has_many :messages

## pets テーブル

| Column |    Type    | Options     |
| ------ | ---------- | ----------- |
| name   | string     | null: false |
| text   | text       | null: false |
| address| string     | null: false | 
| user   | references | null: false, foreign_key: true |

- belongs_to :user
- has_many :comments

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :pet

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

- belongs_to :user