class Room < ApplicationRecord
  has_many :user_rooms, dependent: :destroy
  has_many :users, through: :user_rooms, validate: false
  has_many :topics, dependent: :destroy
  has_many :comments
  
  
  validates :name, presence: true
  

  
end
