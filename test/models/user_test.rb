require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#full_name returns a concatenated first and last name" do
    # SETUP
    user = User.new(first_name: "John", last_name: "Lennon")
    # VERIFY
    full_name = user.full_name
    # ASSERT
    assert_equal "John Lennon", full_name
  end

  test "#full_name works without a first_name" do
    # SETUP
    user = User.new(last_name: "Lennon")
    # VERIFY
    full_name = user.full_name
    # ASSERT
    assert_equal "Lennon", full_name
  end
end
