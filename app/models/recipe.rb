class Recipe
  attr_accessor :title, :chef, :prep_time, :ingredients, :directions

  def initialize(input_options)
    @title = input_options[:title]
    @chef = input_options[:chef]
    @prep_time = input_options[:title]
    @ingredients = input_options[:ingredients]
    @directions = input_options[:directions]
  end
end
