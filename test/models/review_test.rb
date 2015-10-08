require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
    
  def setup
    @review = Review.new(body: "That is a nice recipe!")  
  end
  
  test "Review should be valid" do
    assert @review.valid?
  end
  
  test "review body should be present" do 
    @review.body = ""
    assert_not @review.valid?
  end
  
  test "reivew should not be too long" do 
    @review.body = "a" * 201
    assert_not @review.valid?
  end

end