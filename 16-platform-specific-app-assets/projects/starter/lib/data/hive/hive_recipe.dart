import 'package:hive/hive.dart';

part 'hive_recipe.g.dart';

@HiveType(typeId: 0)
class HiveRecipe extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? label;

  @HiveField(2)
  String? image;

  @HiveField(3)
  String? url;

  @HiveField(4)
  double? calories;

  @HiveField(5)
  double? totalWeight;

  @HiveField(6)
  double? totalTime;

  HiveRecipe({
    this.id,
    this.label,
    this.image,
    this.url,
    this.calories,
    this.totalWeight,
    this.totalTime,
  });
}
