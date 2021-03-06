Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/recipes" => "recipes#index"
    post "/recipes" => "recipes#create"
    get "/recipes/:id" => "recipes#show"
    patch "/recipes/:id" => "recipes#update"
    delete "/recipes/:id" => "recipes#destroy"

    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
  end

  get "/*path" => proc { [200, {}, [ActionView::Base.new.render(file: "public/index.html")]] }
end
