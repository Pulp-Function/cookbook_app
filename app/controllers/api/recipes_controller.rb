class Api::RecipesController < ApplicationController
  before_action :authenticate_user, only: [:create, :update, :destroy]

  def index
    @recipes = Recipe.all

    if params[:title_search_terms]
      @recipes = @recipes.where("title ILIKE ?", "%#{params[:title_search_terms]}%")
    end

    @recipes = @recipes.order(:id => :desc)

    render "index.json.jb"
  end

  def create
    response = Cloudinary::Uploader.upload(params[:image], resource_type: :auto)
    cloudinary_url = response["secure_url"]

    @recipe = Recipe.new(
      title: params["title"],
      chef: params["chef"],
      prep_time: params["prep_time"],
      ingredients: params["ingredients"],
      directions: params["directions"],
      image_url: cloudinary_url,
      user_id: current_user.id, # get the user id from the jwt somehow
    )
    if @recipe.save
      render "show.json.jb"
    else
      render json: { errors: @recipe.errors.full_messages }, status: 422
    end
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
    @recipe.image_url = params["image_url"] || @recipe.image_url
    @recipe.save
    render "show.json.jb"
  end

  def destroy
    recipe = Recipe.find_by(id: params["id"])
    recipe.destroy
    render json: { message: "Recipe successfully destroyed!" }
  end
end
