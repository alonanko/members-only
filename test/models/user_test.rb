require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "Jerry", email: "jerry@home.com", password: "jerry",
                     password_confirmation: "jerry")
  end

  test "should be a valid user" do
    assert @user.valid?
  end

  test "incorrect email form" do
    @user.email = "bad"
    assert_not @user.valid?
  end

  test "password incorrect" do
    @user.password = "!"
    assert_not @user.valid?
  end

  test "confirmation doesnt match password" do
    @user.password = "stocky"
    @user.password_confirmation = "kooky"
    assert_not @user.valid?
  end
end