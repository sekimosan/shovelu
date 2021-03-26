class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options   presence: true do
    validates :nickname,length: {maximum : 10}
    validates :user_name, uniqueness: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i },length: {in: 8..12}
    validates :gender,:age,:profile
  end    
end
