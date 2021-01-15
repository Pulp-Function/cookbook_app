class Api::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render "index.json.jb"
  end

  def create
    @recipe = Recipe.new(
      title: params["title"],
      chef: params["chef"],
      prep_time: params["prep_time"],
      ingredients: params["ingredients"],
      directions: params["directions"],
    )
    @recipe.save
    render "show.json.jb"
  end

  def show
    @recipe = Recipe.find_by(id: params["id"])
    render "show.json.jb"
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.title = params["title"] || @recipe.title
    @recipe.chef = params["chef"] || @recipe.chef
    @recipe.prep_time = params["prep_time"] || @recipe.prep_time
    @recipe.ingredients = params["ingredients"] || @recipe.ingredients
    @recipe.directions = params["directions"] || @recipe.directions
    @recipe.save
    render "show.json.jb"
  end

  def destroy
    recipe = Recipe.find_by(id: params["id"])
    recipe.destroy
    render json: { message: "Recipe successfully destroyed!" }
  end
end
