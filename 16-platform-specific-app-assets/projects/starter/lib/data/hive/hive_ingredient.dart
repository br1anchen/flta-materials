import 'package:hive/hive.dart';

part 'hive_ingredient.g.dart';

@HiveType(typeId: 0)
class HiveIngredient extends HiveObject {
  @HiveField(0)
  int? recipeId;

  @HiveField(1)
  String? name;

  @HiveField(2)
  double? weight;

  HiveIngredient({this.recipeId, this.name, this.weight});
}
