require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録が成功するとき" do
      it "nickname,email,user_name,password,password_confirmation,age_id,gender_id,profileが正しく記入されている" do
        expect(@user).to be_valid
      end
      it "profileがなくても登録ができる" do
        @user.profile = nil
        expect(@user).to be_valid
      end
    end
  end
end
