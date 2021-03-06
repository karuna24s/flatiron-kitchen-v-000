class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def ingredients_attributes=(ingredient_attributes)
    ingredient_attributes.values.each do |ingredient_attribute|
      ingredient = Ingredient.find_or_create_by(category_attribute)
      self.ingredients << ingredient
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids:[],
        ingredients_attributes: [:name])
  end

end
