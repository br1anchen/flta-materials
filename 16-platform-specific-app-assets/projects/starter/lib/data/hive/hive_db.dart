import 'dart:convert';
import 'dart:typed_data';
import 'package:hive/hive.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/models.dart';
import './hive_recipe.dart';
import './hive_ingredient.dart';

Recipe hiveRecipeToRecipe(int id, HiveRecipe hiveRecipe) {
  return Recipe(
      id: id,
      label: hiveRecipe.label,
      image: hiveRecipe.image,
      url: hiveRecipe.url,
      calories: hiveRecipe.calories,
      totalWeight: hiveRecipe.totalWeight,
      totalTime: hiveRecipe.totalTime);
}

HiveRecipe recipeToInsertableHiveRecipe(Recipe recipe) {
  return HiveRecipe(
      url: recipe.url,
      image: recipe.image,
      calories: recipe.calories,
      totalWeight: recipe.totalWeight);
}

Ingredient hiveIngredientToIngredient(HiveIngredient ingredient) {
  return Ingredient(
      recipeId: ingredient.recipeId,
      name: ingredient.name,
      weight: ingredient.weight);
}

HiveIngredient ingredientToInsertableHiveIngredient(Ingredient ingredient) {
  return HiveIngredient(
      recipeId: ingredient.recipeId,
      name: ingredient.name,
      weight: ingredient.weight);
}

class RecipeDatabase {
  late Uint8List _encryptionKey;

  Future<void> init() async {
    await Hive.initFlutter();

    const secureStorage = FlutterSecureStorage();
    final containsEncryptionKey = await secureStorage.containsKey(key: 'key');
    if (!containsEncryptionKey) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(key: 'key', value: base64UrlEncode(key));
    }

    _encryptionKey =
        base64Url.decode(await secureStorage.read(key: 'key') as String);
    print('Encryption key: $_encryptionKey');

    Hive.registerAdapter(HiveRecipeAdapter());
    Hive.registerAdapter(HiveIngredientAdapter());
  }

  Future<Box<HiveRecipe>> openReipesBox() {
    return Hive.openBox<HiveRecipe>('recipes',
        encryptionCipher: HiveAesCipher(_encryptionKey));
  }

  Future<Box<HiveIngredient>> openIngredientsBox() {
    return Hive.openBox<HiveIngredient>('ingredients',
        encryptionCipher: HiveAesCipher(_encryptionKey));
  }
}

class RecipeDao {
  final Box<HiveRecipe> box;

  RecipeDao(this.box);

  static List<Recipe> mapAllHiveRecipesToRecipes(Box<HiveRecipe> box) {
    final recipes = <Recipe>[];
    box.keys.toList().forEach((k) {
      final hiveRecipe = box.get(k)!;
      final recipe = hiveRecipeToRecipe(k, hiveRecipe);
      if (!recipes.contains(recipe)) {
        recipes.add(recipe);
      }
    });

    return recipes;
  }

  Future<List<Recipe>> findAllRecipes() =>
      Future.value(RecipeDao.mapAllHiveRecipesToRecipes(box));

  Stream<List<Recipe>> watchAllRecipes() {
    return box.watch().map(
      (event) {
        return RecipeDao.mapAllHiveRecipesToRecipes(box);
      },
    );
  }

  Future<List<Recipe>> findRecipeById(int id) {
    final recipe = box.get(id);
    return Future.value(recipe != null ? [hiveRecipeToRecipe(id, recipe)] : []);
  }

  Future<int> insertRecipe(HiveRecipe recipe) => box.add(recipe);

  Future deleteRecipe(int id) => box.delete(id);
}

class IngredientDao {
  final Box<HiveIngredient> box;

  IngredientDao(this.box);

  static List<Ingredient> mapAllHiveIngredientsToIngredients(
      Box<HiveIngredient> box) {
    final ingredients = <Ingredient>[];
    box.keys.toList().forEach((k) {
      final hiveIngredient = box.get(k)!;
      final ingredient = hiveIngredientToIngredient(hiveIngredient);
      if (!ingredients.contains(ingredient)) {
        ingredients.add(ingredient);
      }
    });
    return ingredients;
  }

  Future<List<Ingredient>> findAllIngredients() =>
      Future.value(IngredientDao.mapAllHiveIngredientsToIngredients(box));

  Stream<List<Ingredient>> watchAllIngredients() => box.watch().map(
        (event) {
          return IngredientDao.mapAllHiveIngredientsToIngredients(box);
        },
      );

  Future<List<Ingredient>> findRecipeIngredients(int recipeId) {
    return Future.value(box.values
        .where((i) => i.recipeId == recipeId)
        .toList()
        .cast<Ingredient>());
  }

  Future<int> insertIngredient(HiveIngredient ingredient) =>
      box.add(ingredient);

  Future deleteIngredient(int id) => box.delete(id);
}
