class Api::RecipesController < ApplicationController
  def first_recipe_method
    @first_recipe = Recipe.first
    render "first_recipe.json.jb"
  end

  def all_recipes_method
    @recipes = Recipe.all
    render "all_recipes.json.jb"
  end
end
