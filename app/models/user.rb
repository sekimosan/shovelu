class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options   presence: true do
    validates :nickname,length: {maximum: 10}
    validates :user_name, uniqueness: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i },length: {in: 8..12}
    validates :gender,:age
  end  
  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  has_many :friends
  has_many :followings, through: :friends, source: :follow
  has_many :reverse_of_friends, class_name: "Friend",foreign_key: "follow_id"
  has_many :followers, through: :reverse_of_friends,source: :user

  def self.search(search)
    unless search == " "
      User.where(user_name: search)
    end

  end  
      
  
  #友達追加機能
  def follow(other_user)
    unless self == other_user
      self.friends.find_or_create_by(follow_id: other_user.id)
    end
  end
  
  def unfollow(other_user)
    friend = self.friends.find_by(follow_id: other_user.id)
    friend.destroy if friend
  end
  
  def following?(other_user)
    self.followings.include?(other_user)
  end  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender  
  belongs_to :age
end
