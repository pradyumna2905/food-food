require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chefname: "John Appleseed", email: "johnappleseed@example.com")
  end

  def notValidAssert
    return assert_not @chef.valid?
  end

  def validAssert
    return assert @chef.valid?
  end


  test "chef should be valid" do
    validAssert
  end

  test "chef name must be present" do
    @chef.chefname = ""
    notValidAssert
  end

  test "chef name must not be too short" do
    @chef.chefname = "a"
    notValidAssert
  end

  test "chef name must not be too long" do
    @chef.chefname = "a" * 49
    notValidAssert
  end

  test "email should be present" do
    @chef.email = ""
    notValidAssert
  end

  test "email address should not be too long" do
    @chef.email = "a" * 106 + "@example.com"
    notValidAssert
  end

  test "email should be unique" do
    duplicate_chef = @chef.dup
    duplicate_chef.email = @chef.email.upcase
    @chef.save
    assert_not duplicate_chef.valid?
  end

  test "email validation should accept valid email addresses" do
    valid_addresses = %w[chef@example.com cH_e-F@example.co.us ch.ef@example.au cg+ef@example.cm]
    valid_addresses.each do |va|
      @chef.email = va
      assert @chef.valid?, '#{va.inspect} should be valid'
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user.example.com user user@ex_am_ple.com]
    invalid_addresses.each do |ia|
      @chef.email = ia
      assert_not @chef.valid?, '#{ia.inspect} should be invalid'
    end
  end

end
