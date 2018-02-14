class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    10.times { @recipe.ingredients.build }
  end
end

private
def recipe_params
  params.require(:recipe).permit(:name, :ingredients_attributes => [:name, :recipe_ingredients_attributes => [:quantity]])
end