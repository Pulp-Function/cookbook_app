require "rails_helper"

RSpec.describe "Recipes", type: :request do
  describe "GET /recipes" do
    it "returns an array of recipes" do
      user = User.create!(name: "Peter", email: "peter@test.com", password: "password")
      Recipe.create!([
        { user_id: user.id, title: "Raw Eggs", chef: "Laura Parsley", ingredients: "Chicken", directions: "Squeeze the chicken", image_url: "http://swansonhealthcenter.com/wp-content/uploads/2011/07/Egg.jpg", prep_time: 1 },
        { user_id: user.id, title: "Empty Sandwich", chef: "Jay Wengrow", ingredients: "Two slices of bread", directions: "Place slices of bread next to each other.", image_url: "http://www.phoenixisstrategic.com/wp-content/uploads/2013/05/blog-empty-sandwich.jpg", prep_time: 72 },
        { user_id: user.id, title: "Licorice", chef: "Jean Claude Packsone", ingredients: "Licorice", directions: "Buy licorice from store.", image_url: "http://cdn2.bigcommerce.com/server6200/aa739/product_images/uploaded_images/red-licorice.png?t=1398725710", prep_time: 120 },
      ])

      get "/api/recipes"
      recipes = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(recipes.length).to eq(3)
    end
  end

  describe "GET /recipes/:id" do
    it "should return a hash with the appropriate attributes" do
      user = User.create!(name: "Peter", email: "peter@test.com", password: "password")
      recipe = Recipe.create!({ user_id: user.id, title: "Raw Eggs", chef: "Laura Parsley", ingredients: "Chicken", directions: "Squeeze the chicken", image_url: "http://swansonhealthcenter.com/wp-content/uploads/2011/07/Egg.jpg", prep_time: 1 })

      get "/api/recipes/#{recipe.id}"
      recipe = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(recipe["title"]).to eq("Raw Eggs")
      expect(recipe["chef"]).to eq("Laura Parsley")
      expect(recipe["ingredients"]).to eq("Chicken")
      expect(recipe["directions"]).to eq("Squeeze the chicken")
      expect(recipe["image_url"]).to eq("http://swansonhealthcenter.com/wp-content/uploads/2011/07/Egg.jpg")
      expect(recipe["prep_time"]).to eq(1)
    end
  end
end
