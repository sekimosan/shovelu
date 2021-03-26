# Shovelu しゃべりゅ
  ## あなたと喋る あなたを深堀る

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

- has_many :topics, through: :user_topics
- has_many :user_topics
- has_many :comments

## topicsテーブル

| Column                 | Type        | Option                           |
| ---------------------- | ----------- | -------------------------------- |
| title                  | text        | null: false                      |
| memo                   | text        |                                  |

### Association

- has_many :users, through: :user_topics
- has_many :user_topics
- has_many :comments


## user_topicsテーブル

| Column                 | Type        | Option                           |
| ---------------------- | ----------- | -------------------------------- |
| user                   | references  | foreign_key: true                |
| topic                  | references  | foreign_key: true                |

### Assocation

- belongs_to :user
- belongs_to :topic

## commentsテーブル

| Column                 | Type        | Option                           |
| ---------------------- | ----------- | -------------------------------- |
| comment                | text        |  null: false                     | 
| topic                  | references  |  foreign_key: true               |
| user                   | references  |  foreign_key: true               |

### Association

- belongs_to :user
- belongs_to :topic