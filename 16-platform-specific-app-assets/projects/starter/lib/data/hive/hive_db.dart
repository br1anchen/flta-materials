import '../models/models.dart';
import './hive_recipe.dart';
import './hive_ingredient.dart';

Recipe hiveRecipeToRecipe(int id, HiveRecipe recipe) {
  return Recipe(
      id: id,
      label: recipe.label,
      image: recipe.image,
      url: recipe.url,
      calories: recipe.calories,
      totalWeight: recipe.totalWeight,
      totalTime: recipe.totalTime);
}

Ingredient hiveIngredientToIngredient(int id, HiveIngredient ingredient) {
  return Ingredient(
      id: id,
      recipeId: ingredient.recipeId,
      name: ingredient.name,
      weight: ingredient.weight);
}

class HiveDB {}
