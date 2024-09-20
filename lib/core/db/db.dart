import 'package:hive_flutter/hive_flutter.dart';

import '../models/recipe.dart';
import '../utils.dart';

class DB {
  static String boxName = 'coffeeExpertBox';
  static String keyName = 'recipesList';
  static List<Recipe> recipesList = [];
}

Future<void> initHive() async {
  try {
    await Hive.initFlutter();
    // await Hive.deleteBoxFromDisk(DB.boxName);
    Hive.registerAdapter(RecipeAdapter());
  } catch (e) {
    logger(e);
  }
}

Future<void> getRecipes() async {
  try {
    final box = await Hive.openBox(DB.boxName);
    List data = box.get(DB.keyName) ?? recipesInitial;
    DB.recipesList = data.cast<Recipe>();
    logger(DB.recipesList.length);
  } catch (e) {
    logger(e);
  }
}

Future<void> updateRecipes() async {
  try {
    final box = await Hive.openBox(DB.boxName);
    box.put(DB.keyName, DB.recipesList);
    DB.recipesList = await box.get(DB.keyName);
  } catch (e) {
    logger(e);
  }
}
