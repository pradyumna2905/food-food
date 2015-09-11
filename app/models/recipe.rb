class Recipe < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 5, maximum: 24}
  validates :summary, presence: true, length: {minimum: 10, maximum: 150}
  validates :description, presence: true, length: {minimum: 20, maximum: 500}
end
