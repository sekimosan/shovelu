# Shovelu しゃべりゅ
 あなたと喋る あなたを深堀る

## アプリケーション概要
 仲の良い友人と話題を選んでトークができる
## 利用方法
  1.ユーザーを探す
  2.相互フォローのユーザーをルームに招待する
  3.ルームで相手と話したいお題を出す
  4.サイコロを振って誰がなんのお題を話すのか決める
  5.お題について自分の考えを話す

## 目指した課題解決
 久々に会った友人との大切な時間が、近況報告という会わなかった期間の出来事のすり合わせで終わってしまう。そこに寂しさや物足りなさを感じる人々に、自分と相手の"今"の考えを話す機会をつくることができる。

## 要件
- ユーザー管理機能
- 相互フォロー機能
- ルーム機能
- トピック機能
- トピック選出機能
- コメントログ機能

## 今後実装予定の機能
- コメントログ機能

## URL
 デプロイ後添付

## usersテーブル

| Column                 | Type        | Option                           |
| ---------------------- | ----------- | -------------------------------- |
| nickname               | string      | null: false                      |
| user_name              | string      | null: false unique: true         |
| email                  | string      | deviseを用いて実装                 |
| encrypted_password     | string      | deviseを用いて実装                 |
| gender                 | integer     | null: false ActiveHash           |
| age                    | integer     | null: false ActiveHash           |
| profile                | text        | 

### Association

- has_many :rooms, through: :user_rooms
- has_many :user_rooms
- has_many :topics
- has_many :comments
- has_many :relationships

## relationshipsテーブル
| Column                 | Type        | Option                           |
| ---------------------- | ----------- | -------------------------------- |
| follower_id            | integer     | userモデルからid参照               |
| followed_id            | integer     | userモデルからid参照               |

- belongs_to :user

## roomsテーブル

| Column                 | Type        | Option                           |
| ---------------------- | ----------- | -------------------------------- |
| name                   | string      | null: false                      |

### Association

- has_many :user_rooms
- has_many :users ,through: :user_rooms
- has_many :comments
- has_many :topics

## topicsテーブル

| Column                 | Type        | Option                           |
| ---------------------- | ----------- | -------------------------------- |
| title                  | text        | null: false                      |
| memo                   | text        |                                  |
| room                   | references  | foreign_key: true
### Association

- has_many :users, through: :user_rooms
- has_many :user_rooms
- has_many :comments
- belongs_to :room


## user_roomsテーブル

| Column                 | Type        | Option                           |
| ---------------------- | ----------- | -------------------------------- |
| user                   | references  | foreign_key: true                |
| room                   | references  | foreign_key: true                |

### Assocation

- belongs_to :user
- belongs_to :room

## commentsテーブル

| Column                 | Type        | Option                           |
| ---------------------- | ----------- | -------------------------------- |
| comment                | text        |  null: false                     | 
| topic                  | references  |  foreign_key: true               |
| user                   | references  |  foreign_key: true               |
| room                   | references  |  foreign_key: true               |

### Association

- belongs_to :user
- belongs_to :topic
- belongs_to :room