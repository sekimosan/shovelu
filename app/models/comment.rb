class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  belongs_to :room

  
end
