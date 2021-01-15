Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/recipes" => "recipes#index"
    get "/first_recipe_path" => "recipes#first_recipe_method"
  end
end
