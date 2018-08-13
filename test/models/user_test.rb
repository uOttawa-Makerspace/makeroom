require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "valid user" do
    user = User.create(:first_name => "Olivia", :last_name => "Oliver", :username => "olivia", :email => "olivia@gmail.com", :password => "Password1", :organization_id => 1)
    assert user.valid?, "User is invalid"

    user.organization_id = nil
    assert user.invalid?, "User is valid"

    user.organization_id = 1
    user.first_name = nil
    assert user.invalid?, "User is valid"

    user.first_name = "Olivia"
    user.last_name = nil
    assert user.invalid?, "User is valid"

    user.last_name = "Oliver"
    user.email = nil
    assert user.invalid?, "User is valid"

    user.email = "olivia@gmail.com"
    user.password = nil
    assert user.invalid?, "User is valid"

    user.password = "Password1"
    user.username = nil
    assert user.invalid?, "User is valid"

    user.username = "olivia"
    assert user.valid?, "User is invalid"
  end

end
