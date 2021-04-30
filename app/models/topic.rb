class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :title, presence: true
  validate :room_topics_up_to_six

  private
  def room_topics_up_to_six
    if self.room && self.room.topics.count >= 6
      errors.add(:topic,"トピックは６つまでです")
    end
  end    

end
