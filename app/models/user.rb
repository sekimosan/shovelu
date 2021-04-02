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
  has_many :follower, class_name: "Relationship",foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower
  has_many :topics

  def self.search(search)
    unless search == " "
      User.where(user_name: search)
    end
  end  

  def follow(user_id)
    follower.create(followed_id: user_id)
  end
  
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end
  
  def following?(user)
    following_user.include?(user)
  end  

  def follower?(user)
    follower_user.include?(user)
  end  
      
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender  
  belongs_to :age
end
