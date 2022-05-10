require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "creates a user with first and last name, unique email, password and matching password confirmation" do
      @user = User.create(first_name: "Test", last_name: "User", email: "a@a.com",
        password: "test", password_confirmation: "test")

      expect(@user).to be_valid
    end

    it "throws an error when the password and password confirmation do not match" do
      @user = User.create(first_name: "Test", last_name: "User", email: "a@a.com",
        password: "test", password_confirmation: "test")

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "throws an error when the password is not provided" do
      @user = User.create(first_name: "Test", last_name: "User", email: "a@a.com")

      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "throws an error when the first name is not provided" do
      @user = User.create(last_name: "User", email: "a@a.com",
        password: "test", password_confirmation: "test")

      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "throws an error when the last name is not provided" do
      @user = User.create(first_name: "Test", email: "a@a.com",
        password: "test", password_confirmation: "test")

      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "throws an error when the email is not provided" do
      @user = User.create(first_name: "Test", last_name: "User",
        password: "test", password_confirmation: "test")

      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "throws an error when the email is not unique" do
      @user1 = User.create(first_name: 'Test', last_name: 'User', email: 'a@a.com',
        password: 'test', password_confirmation: 'test')

      @user2 = User.create(first_name: 'Testing', last_name: 'User', email: 'A@A.com',
        password: 'test', password_confirmation: 'test')

      expect(@user1).to be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it "throws an error when the password is shorter than the minimum length" do
      @user = User.create(first_name: 'Test', last_name: 'User', email: 'a@a.com',
        password: '12', password_confirmation: '12')

      expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end

  end
end
