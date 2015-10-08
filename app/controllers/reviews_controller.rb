class ReviewsController < ApplicationController 
    
  def create
    @reviews = Review.new
  end
  
  def edit
  
  end
  
end