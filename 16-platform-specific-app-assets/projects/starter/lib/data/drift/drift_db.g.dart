// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DriftRecipeData extends DataClass implements Insertable<DriftRecipeData> {
  final int id;
  final String label;
  final String image;
  final String url;
  final double calories;
  final double totalWeight;
  final double totalTime;
  DriftRecipeData(
      {required this.id,
      required this.label,
      required this.image,
      required this.url,
      required this.calories,
      required this.totalWeight,
      required this.totalTime});
  factory DriftRecipeData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DriftRecipeData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      label: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}label'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image'])!,
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
      calories: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}calories'])!,
      totalWeight: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_weight'])!,
      totalTime: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_time'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['label'] = Variable<String>(label);
    map['image'] = Variable<String>(image);
    map['url'] = Variable<String>(url);
    map['calories'] = Variable<double>(calories);
    map['total_weight'] = Variable<double>(totalWeight);
    map['total_time'] = Variable<double>(totalTime);
    return map;
  }

  DriftRecipeCompanion toCompanion(bool nullToAbsent) {
    return DriftRecipeCompanion(
      id: Value(id),
      label: Value(label),
      image: Value(image),
      url: Value(url),
      calories: Value(calories),
      totalWeight: Value(totalWeight),
      totalTime: Value(totalTime),
    );
  }

  factory DriftRecipeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftRecipeData(
      id: serializer.fromJson<int>(json['id']),
      label: serializer.fromJson<String>(json['label']),
      image: serializer.fromJson<String>(json['image']),
      url: serializer.fromJson<String>(json['url']),
      calories: serializer.fromJson<double>(json['calories']),
      totalWeight: serializer.fromJson<double>(json['totalWeight']),
      totalTime: serializer.fromJson<double>(json['totalTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'label': serializer.toJson<String>(label),
      'image': serializer.toJson<String>(image),
      'url': serializer.toJson<String>(url),
      'calories': serializer.toJson<double>(calories),
      'totalWeight': serializer.toJson<double>(totalWeight),
      'totalTime': serializer.toJson<double>(totalTime),
    };
  }

  DriftRecipeData copyWith(
          {int? id,
          String? label,
          String? image,
          String? url,
          double? calories,
          double? totalWeight,
          double? totalTime}) =>
      DriftRecipeData(
        id: id ?? this.id,
        label: label ?? this.label,
        image: image ?? this.image,
        url: url ?? this.url,
        calories: calories ?? this.calories,
        totalWeight: totalWeight ?? this.totalWeight,
        totalTime: totalTime ?? this.totalTime,
      );
  @override
  String toString() {
    return (StringBuffer('DriftRecipeData(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('image: $image, ')
          ..write('url: $url, ')
          ..write('calories: $calories, ')
          ..write('totalWeight: $totalWeight, ')
          ..write('totalTime: $totalTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, label, image, url, calories, totalWeight, totalTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftRecipeData &&
          other.id == this.id &&
          other.label == this.label &&
          other.image == this.image &&
          other.url == this.url &&
          other.calories == this.calories &&
          other.totalWeight == this.totalWeight &&
          other.totalTime == this.totalTime);
}

class DriftRecipeCompanion extends UpdateCompanion<DriftRecipeData> {
  final Value<int> id;
  final Value<String> label;
  final Value<String> image;
  final Value<String> url;
  final Value<double> calories;
  final Value<double> totalWeight;
  final Value<double> totalTime;
  const DriftRecipeCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
    this.image = const Value.absent(),
    this.url = const Value.absent(),
    this.calories = const Value.absent(),
    this.totalWeight = const Value.absent(),
    this.totalTime = const Value.absent(),
  });
  DriftRecipeCompanion.insert({
    this.id = const Value.absent(),
    required String label,
    required String image,
    required String url,
    required double calories,
    required double totalWeight,
    required double totalTime,
  })  : label = Value(label),
        image = Value(image),
        url = Value(url),
        calories = Value(calories),
        totalWeight = Value(totalWeight),
        totalTime = Value(totalTime);
  static Insertable<DriftRecipeData> custom({
    Expression<int>? id,
    Expression<String>? label,
    Expression<String>? image,
    Expression<String>? url,
    Expression<double>? calories,
    Expression<double>? totalWeight,
    Expression<double>? totalTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
      if (image != null) 'image': image,
      if (url != null) 'url': url,
      if (calories != null) 'calories': calories,
      if (totalWeight != null) 'total_weight': totalWeight,
      if (totalTime != null) 'total_time': totalTime,
    });
  }

  DriftRecipeCompanion copyWith(
      {Value<int>? id,
      Value<String>? label,
      Value<String>? image,
      Value<String>? url,
      Value<double>? calories,
      Value<double>? totalWeight,
      Value<double>? totalTime}) {
    return DriftRecipeCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
      image: image ?? this.image,
      url: url ?? this.url,
      calories: calories ?? this.calories,
      totalWeight: totalWeight ?? this.totalWeight,
      totalTime: totalTime ?? this.totalTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (calories.present) {
      map['calories'] = Variable<double>(calories.value);
    }
    if (totalWeight.present) {
      map['total_weight'] = Variable<double>(totalWeight.value);
    }
    if (totalTime.present) {
      map['total_time'] = Variable<double>(totalTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftRecipeCompanion(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('image: $image, ')
          ..write('url: $url, ')
          ..write('calories: $calories, ')
          ..write('totalWeight: $totalWeight, ')
          ..write('totalTime: $totalTime')
          ..write(')'))
        .toString();
  }
}

class $DriftRecipeTable extends DriftRecipe
    with TableInfo<$DriftRecipeTable, DriftRecipeData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DriftRecipeTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String?> label = GeneratedColumn<String?>(
      'label', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String?> url = GeneratedColumn<String?>(
      'url', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _caloriesMeta = const VerificationMeta('calories');
  @override
  late final GeneratedColumn<double?> calories = GeneratedColumn<double?>(
      'calories', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _totalWeightMeta =
      const VerificationMeta('totalWeight');
  @override
  late final GeneratedColumn<double?> totalWeight = GeneratedColumn<double?>(
      'total_weight', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _totalTimeMeta = const VerificationMeta('totalTime');
  @override
  late final GeneratedColumn<double?> totalTime = GeneratedColumn<double?>(
      'total_time', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, label, image, url, calories, totalWeight, totalTime];
  @override
  String get aliasedName => _alias ?? 'drift_recipe';
  @override
  String get actualTableName => 'drift_recipe';
  @override
  VerificationContext validateIntegrity(Insertable<DriftRecipeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('calories')) {
      context.handle(_caloriesMeta,
          calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta));
    } else if (isInserting) {
      context.missing(_caloriesMeta);
    }
    if (data.containsKey('total_weight')) {
      context.handle(
          _totalWeightMeta,
          totalWeight.isAcceptableOrUnknown(
              data['total_weight']!, _totalWeightMeta));
    } else if (isInserting) {
      context.missing(_totalWeightMeta);
    }
    if (data.containsKey('total_time')) {
      context.handle(_totalTimeMeta,
          totalTime.isAcceptableOrUnknown(data['total_time']!, _totalTimeMeta));
    } else if (isInserting) {
      context.missing(_totalTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftRecipeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DriftRecipeData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DriftRecipeTable createAlias(String alias) {
    return $DriftRecipeTable(_db, alias);
  }
}

class DriftIngredientData extends DataClass
    implements Insertable<DriftIngredientData> {
  final int id;
  final int recipeId;
  final String name;
  final double weight;
  DriftIngredientData(
      {required this.id,
      required this.recipeId,
      required this.name,
      required this.weight});
  factory DriftIngredientData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DriftIngredientData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      recipeId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}recipe_id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      weight: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weight'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['recipe_id'] = Variable<int>(recipeId);
    map['name'] = Variable<String>(name);
    map['weight'] = Variable<double>(weight);
    return map;
  }

  DriftIngredientCompanion toCompanion(bool nullToAbsent) {
    return DriftIngredientCompanion(
      id: Value(id),
      recipeId: Value(recipeId),
      name: Value(name),
      weight: Value(weight),
    );
  }

  factory DriftIngredientData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftIngredientData(
      id: serializer.fromJson<int>(json['id']),
      recipeId: serializer.fromJson<int>(json['recipeId']),
      name: serializer.fromJson<String>(json['name']),
      weight: serializer.fromJson<double>(json['weight']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'recipeId': serializer.toJson<int>(recipeId),
      'name': serializer.toJson<String>(name),
      'weight': serializer.toJson<double>(weight),
    };
  }

  DriftIngredientData copyWith(
          {int? id, int? recipeId, String? name, double? weight}) =>
      DriftIngredientData(
        id: id ?? this.id,
        recipeId: recipeId ?? this.recipeId,
        name: name ?? this.name,
        weight: weight ?? this.weight,
      );
  @override
  String toString() {
    return (StringBuffer('DriftIngredientData(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('name: $name, ')
          ..write('weight: $weight')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, recipeId, name, weight);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftIngredientData &&
          other.id == this.id &&
          other.recipeId == this.recipeId &&
          other.name == this.name &&
          other.weight == this.weight);
}

class DriftIngredientCompanion extends UpdateCompanion<DriftIngredientData> {
  final Value<int> id;
  final Value<int> recipeId;
  final Value<String> name;
  final Value<double> weight;
  const DriftIngredientCompanion({
    this.id = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.name = const Value.absent(),
    this.weight = const Value.absent(),
  });
  DriftIngredientCompanion.insert({
    this.id = const Value.absent(),
    required int recipeId,
    required String name,
    required double weight,
  })  : recipeId = Value(recipeId),
        name = Value(name),
        weight = Value(weight);
  static Insertable<DriftIngredientData> custom({
    Expression<int>? id,
    Expression<int>? recipeId,
    Expression<String>? name,
    Expression<double>? weight,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recipeId != null) 'recipe_id': recipeId,
      if (name != null) 'name': name,
      if (weight != null) 'weight': weight,
    });
  }

  DriftIngredientCompanion copyWith(
      {Value<int>? id,
      Value<int>? recipeId,
      Value<String>? name,
      Value<double>? weight}) {
    return DriftIngredientCompanion(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      name: name ?? this.name,
      weight: weight ?? this.weight,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<int>(recipeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftIngredientCompanion(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('name: $name, ')
          ..write('weight: $weight')
          ..write(')'))
        .toString();
  }
}

class $DriftIngredientTable extends DriftIngredient
    with TableInfo<$DriftIngredientTable, DriftIngredientData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DriftIngredientTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _recipeIdMeta = const VerificationMeta('recipeId');
  @override
  late final GeneratedColumn<int?> recipeId = GeneratedColumn<int?>(
      'recipe_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double?> weight = GeneratedColumn<double?>(
      'weight', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, recipeId, name, weight];
  @override
  String get aliasedName => _alias ?? 'drift_ingredient';
  @override
  String get actualTableName => 'drift_ingredient';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftIngredientData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('recipe_id')) {
      context.handle(_recipeIdMeta,
          recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta));
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftIngredientData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DriftIngredientData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DriftIngredientTable createAlias(String alias) {
    return $DriftIngredientTable(_db, alias);
  }
}

abstract class _$RecipeDatabase extends GeneratedDatabase {
  _$RecipeDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $DriftRecipeTable driftRecipe = $DriftRecipeTable(this);
  late final $DriftIngredientTable driftIngredient =
      $DriftIngredientTable(this);
  late final RecipeDao recipeDao = RecipeDao(this as RecipeDatabase);
  late final IngredientDao ingredientDao =
      IngredientDao(this as RecipeDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [driftRecipe, driftIngredient];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$RecipeDaoMixin on DatabaseAccessor<RecipeDatabase> {
  $DriftRecipeTable get driftRecipe => attachedDatabase.driftRecipe;
}
mixin _$IngredientDaoMixin on DatabaseAccessor<RecipeDatabase> {
  $DriftIngredientTable get driftIngredient => attachedDatabase.driftIngredient;
}
