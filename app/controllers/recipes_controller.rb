class RecipesController < ApplicationController
  def index
    render json: Recipe.all
  end

  def create
    recipe = User.find(session[:user_id]).recipes.create!(parameters)
    render json: recipe, status: :created
  end

  private

  def parameters
    params.permit(:title, :instructions, :minutes_to_complete)
  end
end
