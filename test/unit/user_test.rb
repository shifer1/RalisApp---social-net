require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "A user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "A user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

   test "A user should enter a user name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:user_name].empty?
  end

  test "A user should have a unique user name" do
    user = User.new
    user.user_name = users(:jason).user_name

    assert !user.save
    assert !user.errors[:user_name].empty?
  end

  test "A user should have a user name withot spaces" do
    user = User.new
    user.user_name = "My user with spaces"
    
    assert !user.save
    assert !user.errors[:user_name].empty?
    assert user.errors[:user_name].include?("Must be formatted correctly.")
  end

end
