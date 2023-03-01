# README

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| profile            |  text  | null: false |
| occupation         |  text  | null: false |
| position           |  text  | null: false |

- has_many :comments
- has_many :prototypes

## commentsテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null                           |
| user    | references | null: false, foreign_key: true |
|prototype| references | null: false, foreign_key: true |

- belongs_to :prototype
- belongs_to :user

## prototypesテーブル
| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| title    | string     | null                           |
|catch_copy| text       | null: false                    |
| concept  | text       | null: false                    |
| user     | references | null: false, foreign_key: true |

- has_many :comments
- belongs_to :users
