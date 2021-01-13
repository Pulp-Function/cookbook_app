Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/first_recipe_path" => "recipes#first_recipe_method"
    get "/all_recipes_path" => "recipes#all_recipes_method"
  end
end
