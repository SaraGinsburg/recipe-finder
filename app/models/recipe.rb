class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  
  validates_presence_of :name

  # accepts_nested_attributes_for :ingredients

  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.values.each do |ingredients_attribute|
      # raise ingredients_attribute.inspect
      if ingredients_attribute["name"] != ''
        ingredient = Ingredient.find_or_create_by(name: ingredients_attribute["name"])
        self.recipe_ingredients.build(ingredient: ingredient, quantity: ingredients_attribute["recipe_ingredients"]["quantity"])
      end
    end
  end

  def self.most_recently_updated
    order('updated_at desc').first
  end
end
