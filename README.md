# Shovelu 
  
  ## 名前の由来　
  土を掘るshovel + 喋る + you　の造語
  あなたを深く知る(深掘る) / あなたと喋る


  ## アプリケーション概要
  仲の良い友人と話題を選んでトークができる
  
  

  ## 利用方法
  1.ログイン後ユーザーを探す  
  2.相互フォローのユーザーをルームに招待する   
  3.ルームで相手と話したいお題を出す  
  4.サイコロを振って誰がなんのお題を話すのか決める  
  5.お題について自分の考えを話す 
   

  ## 作成背景
  ターゲット : 20代〜　１人暮らしの社会人  

  久々に会った友人との大切な時間が、近況報告という会わなかった期間の出来事のすり合わせで終わってしまう。  
  そこに物足りなさや寂しさを感じており、たまにはお互いの価値観など今やこれからの話がしたいと思っている。

  ##  解決したい課題
  お互いに話したい内容を議題にしてわかりやすくする  
  ランダム要素でゲーム感覚で気軽に使える
  今やこれからの話をするきっかけにする



## 要件
- ユーザー管理機能 
  - ユーザーごとに管理を行うため
- 相互フォロー機能
  - 相互フォローの関係を作るため
- ルーム機能
  - 閲覧を限定しプライベートの空間にするため
- トピック機能
  - お題をわかりやすく一覧化
  - 詳細や削除ができるようにするため
- トピック選出機能
  - ランダムによってゲーム感覚の気軽さを持たせるため
- コメントログ機能
  - 議事録や感想を残すため
## 今後の実装予定
- コメントログ機能
- トピックの非同期通信化　(Ajaxを使用)

## URL
http://35.72.188.223/

テスト用アカウント  
- テストユーザー１  
メールアドレス　aaaa@gmail.com  
パスワード　1a2s3d  

- テストユーザー２  
メールアドレス　bbbb@gmail.com  
パスワード　1a2s3d  

トピック作成後はルームを削除していただけると幸いです。



## 各機能動画 おおまかな内容のみ
 1. 新規登録/ログイン
[![Image from Gyazo](https://i.gyazo.com/d6a417856200a822bad81d56276af4ee.gif)](https://gyazo.com/d6a417856200a822bad81d56276af4ee)
 2. ユーザー検索機能　フォロー機能
 [![Image from Gyazo](https://i.gyazo.com/9ad8ee91ed9e88520562610792040280.gif)](https://gyazo.com/9ad8ee91ed9e88520562610792040280)
 3. ルーム作成
 [![Image from Gyazo](https://i.gyazo.com/8f22311cdad2cbdf116ee3d2b77e2245.gif)](https://gyazo.com/8f22311cdad2cbdf116ee3d2b77e2245)
 4. トピックを６つ作成後サイコロで選出
 [![Image from Gyazo](https://i.gyazo.com/6e1a24f439c34700ab4861a9c0e52d68.gif)](https://gyazo.com/6e1a24f439c34700ab4861a9c0e52d68)


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

## ER図

[![Image from Gyazo](https://i.gyazo.com/d6e0c1f2c085b86c6b0b123cc9593e39.png)](https://gyazo.com/d6e0c1f2c085b86c6b0b123cc9593e39)