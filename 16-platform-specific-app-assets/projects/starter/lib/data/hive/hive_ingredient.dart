import 'package:hive/hive.dart';

part 'hive_ingredient.g.dart';

@HiveType(typeId: 1)
class HiveIngredient extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  int? recipeId;

  @HiveField(2)
  String? name;

  @HiveField(3)
  double? weight;

  HiveIngredient({this.id, this.recipeId, this.name, this.weight});
}
