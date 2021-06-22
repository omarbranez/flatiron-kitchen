class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update]
  before_action :get_ingredients, only: [:new, :edit]
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(recipe_params)
    recipe.save
    redirect_to recipes_path
  end

  def show
  end

  def edit
  end

  def update
    @recipe.update(recipe_params)
    redirect_to recipes_path
  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def get_ingredients
    @ingredients = Ingredient.all
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end
