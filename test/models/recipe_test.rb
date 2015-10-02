require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.create(chefname: "John", email: "john@example.com")
    @recipe = @chef.recipes.build(name: "Mac and Cheese", summary: "An easy to cook not-so-healthy mac and cheese", description: "Boil pasta, make cheese sauce with chhese, milk, and flour. Then place in pan and bake for 40 min. Enjoy!")
  end

  def notValidAssert
    return assert_not @recipe.valid?
  end

  def validAssert
    return assert @recipe.valid?
  end

  test "recipe should be valid" do
    validAssert
  end

  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end

  test "name should be present" do
    @recipe.name = ""
    notValidAssert
  end

  test "name length should not be too long" do
    @recipe.name = "a" * 101
    notValidAssert
  end

  test "name length should not be too short" do
    @recipe.name = "a"
    notValidAssert
  end

  test "summary must be present" do
    @recipe.summary = ""
    notValidAssert
  end

  test "summary length should not be too long" do
    @recipe.summary = "a" * 151
    notValidAssert
  end

  test "summary length should not be too short" do
    @recipe.summary = "a"
    notValidAssert
  end

  test "description should be present" do
    @recipe.description = ""
    notValidAssert
  end

  test "description should not be too long" do
    @recipe.description = "a" * 2001
    notValidAssert
  end

  test "description should not be too short" do
    @recipe.description = "a"
    notValidAssert
  end

end
