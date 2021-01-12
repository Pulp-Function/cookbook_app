class Api::RecipesController < ApplicationController
  def first_recipe_method
    @first_recipe = Recipe.first
    render "first_recipe.json.jb"
  end
end
