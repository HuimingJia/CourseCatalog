require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(firstname: "Huiming", lastname: "Jia", account: "user@example.com", password: "123456", password_confirmation: "123456")
  end

  test "test case should be valid" do
    assert @user.valid?
  end

  test "firstname should be present" do
    @user.firstname = "     "
    assert_not @user.valid?
  end

  test "lastname should be present" do
    @user.lastname = "     "
    assert_not @user.valid?
  end

  test "account should be present" do
    @user.account = "     "
    assert_not @user.valid?
  end

  test "firstname should not be too long" do
    @user.firstname = "a" * 51
    assert_not @user.valid?
  end

  test "lastname should not be too long" do
    @user.firstname = "a" * 51
    assert_not @user.valid?
  end

  test "account should not be too long" do
    @user.account = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "account validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.account = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "account addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.account = @user.account.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "account addresses should be saved as lower-case" do
    mixed_case_account = "Foo@ExAMPle.CoM"
    @user.account = mixed_case_account
    @user.save
    assert_equal mixed_case_account.downcase, @user.reload.account
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
