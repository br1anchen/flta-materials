import '../models/models.dart';

import '../repository.dart';
import './hive_db.dart';

class HiveRepository extends Repository {
  late RecipeDatabase recipeDatabase;
  late RecipeDao _recipeDao;
  late IngredientDao _ingredientDao;
  Stream<List<Ingredient>>? ingredientStream;
  Stream<List<Recipe>>? recipeStream;

  @override
  Future<List<Recipe>> findAllRecipes() {
    return _recipeDao.findAllRecipes().then((recipesWithoutIngredients) {
      final recipes = <Recipe>[];
      recipesWithoutIngredients.forEach(
        (r) async {
          if (r.id != null) {
            r.ingredients = await findRecipeIngredients(r.id!);
          }
          recipes.add(r);
        },
      );
      return recipes;
    });
  }

  @override
  Stream<List<Recipe>> watchAllRecipes() {
    if (recipeStream == null) {
      recipeStream = _recipeDao.watchAllRecipes();
    }
    return recipeStream!;
  }

  @override
  Stream<List<Ingredient>> watchAllIngredients() {
    if (ingredientStream == null) {
      ingredientStream = _ingredientDao.watchAllIngredients();
    }
    return ingredientStream!;
  }

  @override
  Future<Recipe> findRecipeById(int id) {
    return _recipeDao
        .findRecipeById(id)
        .then((listOfRecipes) => listOfRecipes.first);
  }

  @override
  Future<List<Ingredient>> findAllIngredients() {
    return _ingredientDao.findAllIngredients();
  }

  @override
  Future<List<Ingredient>> findRecipeIngredients(int recipeId) {
    return _ingredientDao.findRecipeIngredients(recipeId);
  }

  @override
  Future<int> insertRecipe(Recipe recipe) {
    return Future(
      () async {
        final id =
            await _recipeDao.insertRecipe(recipeToInsertableHiveRecipe(recipe));
        if (recipe.ingredients != null) {
          recipe.ingredients!.forEach(
            (ingredient) {
              ingredient.recipeId = id;
            },
          );
          insertIngredients(recipe.ingredients!);
        }
        return id;
      },
    );
  }

  @override
  Future<List<int>> insertIngredients(List<Ingredient> ingredients) {
    return Future(
      () {
        if (ingredients.length == 0) {
          return <int>[];
        }
        final resultIds = <int>[];
        ingredients.forEach(
          (ingredient) {
            final driftIngredient =
                ingredientToInsertableHiveIngredient(ingredient);
            _ingredientDao
                .insertIngredient(driftIngredient)
                .then((int id) => resultIds.add(id));
          },
        );
        return resultIds;
      },
    );
  }

  @override
  Future<void> deleteRecipe(Recipe recipe) {
    if (recipe.id != null) {
      _recipeDao.deleteRecipe(recipe.id!);
    }
    return Future.value();
  }

  @override
  Future<void> deleteIngredient(Ingredient ingredient) {
    if (ingredient.id != null) {
      return _ingredientDao.deleteIngredient(ingredient.id!);
    } else {
      return Future.value();
    }
  }

  @override
  Future<void> deleteIngredients(List<Ingredient> ingredients) {
    ingredients.forEach((ingredient) {
      if (ingredient.id != null) {
        _ingredientDao.deleteIngredient(ingredient.id!);
      }
    });
    return Future.value();
  }

  @override
  Future<void> deleteRecipeIngredients(int recipeId) async {
    final ingredients = await findRecipeIngredients(recipeId);
    return deleteIngredients(ingredients);
  }

  @override
  Future init() async {
    recipeDatabase = RecipeDatabase();
    await recipeDatabase.init();

    _recipeDao = RecipeDao(await recipeDatabase.openReipesBox());
    _ingredientDao = IngredientDao(await recipeDatabase.openIngredientsBox());
  }

  @override
  void close() {}
}
