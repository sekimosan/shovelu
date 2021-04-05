class Room < ApplicationRecord
  has_many :user_rooms
  has_many :users, through: :user_rooms
  has_many :topics, dependent: :destroy
  
  validates :name, presence: true
  validate :topics_up_to_6

  private
  TOPIC_MAX = 6
  def topics_up_to_6
    if self.topics.size > TOPIC_MAX
      errors.add(:topics,"topics are up to 6")
    end  
  end  
end
