class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    10.times { @recipe.ingredients.build }
  end

  def create
    r = Recipe.create(recipe_params)
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :ingredients_attributes => [:name, :recipe_ingredients => [:quantity]])
  end
end