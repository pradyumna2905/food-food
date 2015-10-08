class Review < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :chef
  
  validates :body, presence: true, length: {minimum: 2, maximum: 200}
end