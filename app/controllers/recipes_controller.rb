class RecipesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_recipe, only: [:show, :update, :destroy]

  def index
    recipes = Recipe.all
    render json: { recipes: recipes }
  end

  def show
    render json: { message: '"Recipe details by id"', recipe: @recipe }
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      render json: { message: "Recipe successfully created!" ,recipe: recipe }
    else
      render json: { message: "Recipe creation failed!", required: "title, making_time, serves, ingredients, cost" }
    end
  end

  def destroy
    if @recipe.destroy
      render json: { message: 'Deleted the recipe', recipe: @recipe }
    else
      render json: { message: "No Recipe found" }
    end
  end

  def update
    @recipe.update(recipe_params)
    render json: { message: '"Recipe successfully updated!"', recipe: @recipe }
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :making_time, :serves, :ingredients, :cost)
  end
end
