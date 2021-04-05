class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :title, presence: true
  validate :room_topics_up_to_6

  private
  TOPIC_MAX = 6
  def room_topics_up_to_6
    if self.room && self.room.topics.count > TOPIC_MAX
      errors.add(:topic,"topics are up to 6")
    end
  end    

end
