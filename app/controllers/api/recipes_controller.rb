class Api::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render "index.json.jb"
  end

  def first_recipe_method
    @first_recipe = Recipe.first
    render "first_recipe.json.jb"
  end
end
