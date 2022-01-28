import 'package:drift/web.dart';
import 'package:drift/drift.dart';

import '../drift_db.dart';

RecipeDatabase constructDb({bool logStatements = false}) {
  final executor = LazyDatabase(() async {
    final db = await DriftWebStorage.indexedDbIfSupported('recipes');
    return WebDatabase.withStorage(db, logStatements: logStatements);
  });
  return RecipeDatabase(executor);
}
