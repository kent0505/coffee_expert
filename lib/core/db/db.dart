import 'package:hive_flutter/hive_flutter.dart';

import '../models/cafe.dart';
import '../models/recipe.dart';
import '../utils.dart';

class DB {
  static String boxName = 'coffeeExpertBox';
  static String recipesKeyName = 'recipesList';
  static String cafesKeyName = 'cafesList';
  static List<Recipe> recipesList = [];
  static List<Cafe> cafesList = [];
}

Future<void> initHive() async {
  try {
    await Hive.initFlutter();
    // await Hive.deleteBoxFromDisk(DB.boxName);
    Hive.registerAdapter(RecipeAdapter());
    Hive.registerAdapter(CafeAdapter());
  } catch (e) {
    logger(e);
  }
}

Future<void> getRecipes() async {
  try {
    final box = await Hive.openBox(DB.boxName);
    List data = box.get(DB.recipesKeyName) ?? recipesInitial;
    DB.recipesList = data.cast<Recipe>();
    logger(DB.recipesList.length);
  } catch (e) {
    logger(e);
  }
}

Future<void> updateRecipes() async {
  try {
    final box = await Hive.openBox(DB.boxName);
    box.put(DB.recipesKeyName, DB.recipesList);
    DB.recipesList = await box.get(DB.recipesKeyName);
  } catch (e) {
    logger(e);
  }
}

Future<void> getCafes() async {
  try {
    final box = await Hive.openBox(DB.boxName);
    List data = box.get(DB.cafesKeyName) ?? cafesInitial;
    DB.cafesList = data.cast<Cafe>();
    logger(DB.cafesList.length);
  } catch (e) {
    logger(e);
  }
}

Future<void> updateCafes() async {
  try {
    final box = await Hive.openBox(DB.boxName);
    box.put(DB.cafesKeyName, DB.cafesList);
    DB.cafesList = await box.get(DB.cafesKeyName);
  } catch (e) {
    logger(e);
  }
}
