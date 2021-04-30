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
    context "新規登録が失敗するとき" do
      it "nicknameが空である" do
        @user.nickname = " "
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "nicknameが11文字以上である" do
        @user.nickname = "aiueokakiku"
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname is too long (maximum is 10 characters)"
      end
      it "emailが空である" do
        @user.email = " "
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "emailが重複している" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it "passwordが5文字以下である" do
        @user.password = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it "passwordが空である" do
        @user.password = " "
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "passwordが全角である" do
        @user.password = "アイウエオ１２３"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "passwordが数字のみである" do
        @user.password = "1234567"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include  "Password is invalid"
      end
      it "passwordが英字のみである" do
        @user.password = "abcdefgh"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "user_nameが７文字以下である" do
        @user.user_name = "aaa1111"
        @user.valid?
        expect(@user.errors.full_messages).to include "User name is too short (minimum is 8 characters)" 
      end
      it "user_nameが13文字以上である" do
        @user.user_name = "aaaaaa1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include "User name is too long (maximum is 12 characters)"
      end
      it "user_nameが英数のみである" do
        @user.user_name = "abcdefghij"
        @user.valid?
        expect(@user.errors.full_messages).to include "User name is invalid"
      end
      it "user_nameが数字のみである" do
        @user.user_name = "123456789"
        @user.valid?
        expect(@user.errors.full_messages).to include "User name is invalid"
      end
      it "user_nameが全角である" do
        @user.user_name = "アイウエオ１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include "User name is invalid"
      end
      it "user_nameが重複している" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.user_name = @user.user_name
        another_user.valid?
        expect(another_user.errors.full_messages).to include "User name has already been taken"
      end
      it "gender_idが空である" do
        @user.gender_id = " "
        @user.valid?
        expect(@user.errors.full_messages).to include "Gender can't be blank"
      end
      it "age_idが空である" do
        @user.age_id = " "
        @user.valid?
        expect(@user.errors.full_messages).to include "Age can't be blank"
      end
      it "profileが200文字以上である" do
        @user.profile = Faker::Lorem.characters(number: 201)
        @user.valid?
        expect(@user.errors.full_messages).to include "Profile is too long (maximum is 200 characters)"
      end
    end
  end
end
