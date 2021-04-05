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

- has_many :rooms, through: :user_rooms
- has_many :user_rooms
- has_many :topics
- has_many :comments

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