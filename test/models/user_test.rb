require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user_one = users(:one)
    @user_two = users(:two)
  end

  test 'should save user successfully' do
    assert @user_one.valid?
  end

  test 'should save user with unique email' do
    assert @user_one.valid?
  end

end
