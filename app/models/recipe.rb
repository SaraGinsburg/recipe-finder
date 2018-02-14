class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  
  validates_presence_of :name

  accepts_nested_attributes_for :ingredients
  def self.most_recently_updated
    order('updated_at desc').first
  end
end
