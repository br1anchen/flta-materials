import 'package:hive/hive.dart';

part 'hive_recipe.g.dart';

@HiveType(typeId: 0)
class HiveRecipe extends HiveObject {
  @HiveField(0)
  String? label;

  @HiveField(1)
  String? image;

  @HiveField(2)
  String? url;

  @HiveField(3)
  double? calories;

  @HiveField(4)
  double? totalWeight;

  @HiveField(5)
  double? totalTime;

  @HiveField(6)
  HiveList? ingredients;

  HiveRecipe(
      {this.label,
      this.image,
      this.url,
      this.calories,
      this.totalWeight,
      this.totalTime,
      this.ingredients});
}
