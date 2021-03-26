class Gender < ActiveHash::Base
  self.data = [
    { id: 1, name: "男性"},
    { id: 2, name: "女性"},
    { id: 3, name: "選択しない"},
  ]

  include ActiveHash::Associations
  has_many :users
end  