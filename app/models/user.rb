class User < ApplicationRecord
  has_many :recipes
  
  validates_uniqueness_of :username
end
