import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'package:path_provider/path_provider.dart' as paths;
import 'package:path/path.dart' as p;

import '../drift_db.dart';

RecipeDatabase constructDb({bool logStatements = false}) {
  final executor = LazyDatabase(() async {
    final dataDir = await paths.getApplicationDocumentsDirectory();
    final file = File(p.join(dataDir.path, 'recipes.sqlite'));
    return NativeDatabase(file, logStatements: logStatements);
  });
  return RecipeDatabase(executor);
}
