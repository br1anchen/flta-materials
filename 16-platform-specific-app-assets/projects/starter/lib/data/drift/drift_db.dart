import 'package:drift/drift.dart';
import '../models/models.dart';

export 'database/shared.dart';

part 'drift_db.g.dart';

class DriftRecipe extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get label => text()();

  TextColumn get image => text()();

  TextColumn get url => text()();

  RealColumn get calories => real()();

  RealColumn get totalWeight => real()();

  RealColumn get totalTime => real()();
}

class DriftIngredient extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get recipeId => integer()();

  TextColumn get name => text()();

  RealColumn get weight => real()();
}

@DriftDatabase(
    tables: [DriftRecipe, DriftIngredient], daos: [RecipeDao, IngredientDao])
class RecipeDatabase extends _$RecipeDatabase {
  RecipeDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}

@DriftAccessor(tables: [DriftRecipe])
class RecipeDao extends DatabaseAccessor<RecipeDatabase> with _$RecipeDaoMixin {
  final RecipeDatabase db;

  RecipeDao(this.db) : super(db);

  Future<List<DriftRecipeData>> findAllRecipes() => select(driftRecipe).get();

  Stream<List<Recipe>> watchAllRecipes() {
    return select(driftRecipe).watch().map(
      (rows) {
        final recipes = <Recipe>[];
        rows.forEach(
          (row) {
            final recipe = driftRecipeToRecipe(row);
            if (!recipes.contains(recipe)) {
              recipe.ingredients = <Ingredient>[];
              recipes.add(recipe);
            }
          },
        );
        return recipes;
      },
    );
  }

  Future<List<DriftRecipeData>> findRecipeById(int id) =>
      (select(driftRecipe)..where((tbl) => tbl.id.equals(id))).get();

  Future<int> insertRecipe(Insertable<DriftRecipeData> recipe) =>
      into(driftRecipe).insert(recipe);

  Future deleteRecipe(int id) => Future.value(
      (delete(driftRecipe)..where((tbl) => tbl.id.equals(id))).go());
}

@DriftAccessor(tables: [DriftIngredient])
class IngredientDao extends DatabaseAccessor<RecipeDatabase>
    with _$IngredientDaoMixin {
  final RecipeDatabase db;

  IngredientDao(this.db) : super(db);

  Future<List<DriftIngredientData>> findAllIngredients() =>
      select(driftIngredient).get();

  Stream<List<DriftIngredientData>> watchAllIngredients() =>
      select(driftIngredient).watch();

  Future<List<DriftIngredientData>> findRecipeIngredients(int id) =>
      (select(driftIngredient)..where((tbl) => tbl.recipeId.equals(id))).get();

  Future<int> insertIngredient(Insertable<DriftIngredientData> ingredient) =>
      into(driftIngredient).insert(ingredient);

  Future deleteIngredient(int id) => Future.value(
      (delete(driftIngredient)..where((tbl) => tbl.id.equals(id))).go());
}

// Conversion Methods
Recipe driftRecipeToRecipe(DriftRecipeData recipe) {
  return Recipe(
      id: recipe.id,
      label: recipe.label,
      image: recipe.image,
      url: recipe.url,
      calories: recipe.calories,
      totalWeight: recipe.totalWeight,
      totalTime: recipe.totalTime);
}

Insertable<DriftRecipeData> recipeToInsertableDriftRecipe(Recipe recipe) {
  return DriftRecipeCompanion.insert(
      label: recipe.label ?? '',
      image: recipe.image ?? '',
      url: recipe.url ?? '',
      calories: recipe.calories ?? 0,
      totalWeight: recipe.totalWeight ?? 0,
      totalTime: recipe.totalTime ?? 0);
}

Ingredient driftIngredientToIngredient(DriftIngredientData ingredient) {
  return Ingredient(
      id: ingredient.id,
      recipeId: ingredient.recipeId,
      name: ingredient.name,
      weight: ingredient.weight);
}

DriftIngredientCompanion ingredientToInsertableDriftIngredient(
    Ingredient ingredient) {
  return DriftIngredientCompanion.insert(
      recipeId: ingredient.recipeId ?? 0,
      name: ingredient.name ?? '',
      weight: ingredient.weight ?? 0);
}
