import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Recipe {
  @HiveField(0)
  final int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  String ingredients;
  @HiveField(4)
  String recipe;
  @HiveField(5)
  String image;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.ingredients,
    required this.recipe,
    required this.image,
  });
}

class RecipeAdapter extends TypeAdapter<Recipe> {
  @override
  final typeId = 0;

  @override
  Recipe read(BinaryReader reader) {
    return Recipe(
      id: reader.read(),
      title: reader.read(),
      description: reader.read(),
      ingredients: reader.read(),
      recipe: reader.read(),
      image: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Recipe obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.description);
    writer.write(obj.ingredients);
    writer.write(obj.recipe);
    writer.write(obj.image);
  }
}

List<Recipe> recipesInitial = [
  Recipe(
    id: 1,
    title: 'Chocolate Brownie Recipe',
    description: 'Ultimate chocolate brownies ...',
    ingredients:
        '200g Unsalted butter (softened)\n\n350g Dark chocolate\n\n3 Free range medium eggs\n\n250g Billington\'s Unrefined Dark Muscovado Sugar\n\n50g Allinson\'s Self-Raising White Flour',
    recipe:
        'Get ready for the ultimate chocolate brownies. We use Billington’s Unrefined Dark Muscovado Sugar, and believe us when we say these make the most indulgently-rich and gooey chocolate brownies you\'ve ever tasted. You\'ll never look at another brownie the same way.\n\nOnce you’ve mastered this recipe, you can go wild exploring new flavour combos. Try adding Caramac or Biscoff spread to add a new twist - we\'ve shown you how to amend the recipe below.\n\nCaramac lovers: Break 6x 30g bars into the brownie mix right before baking. Once baked, drizzle a melted 30g bar over the top.\n\nBonkers for Biscoff? Dollop 200g Biscoff spread into the brownie mix, right before baking. Break up 5 Biscoff biscuits and place the pieces on top of the brownie batter. Bake for 20 minutes extra.',
    image: 'recipe1',
  ),
  Recipe(
    id: 2,
    title: 'Gluten-Free Chocolate',
    description: 'Gorgeously-sweet chocolate ...',
    ingredients:
        '200g Unsalted butter (softened)\n\n350g Dark chocolate\n\n3 Free range medium eggs\n\n250g Billington\'s Unrefined Dark Muscovado Sugar\n\n50g Allinson\'s Self-Raising White Flour',
    recipe:
        'Get ready for the ultimate chocolate brownies. We use Billington’s Unrefined Dark Muscovado Sugar, and believe us when we say these make the most indulgently-rich and gooey chocolate brownies you\'ve ever tasted. You\'ll never look at another brownie the same way.\n\nOnce you’ve mastered this recipe, you can go wild exploring new flavour combos. Try adding Caramac or Biscoff spread to add a new twist - we\'ve shown you how to amend the recipe below.\n\nCaramac lovers: Break 6x 30g bars into the brownie mix right before baking. Once baked, drizzle a melted 30g bar over the top.\n\nBonkers for Biscoff? Dollop 200g Biscoff spread into the brownie mix, right before baking. Break up 5 Biscoff biscuits and place the pieces on top of the brownie batter. Bake for 20 minutes extra.',
    image: 'recipe2',
  ),
  Recipe(
    id: 3,
    title: 'Biscoff Cupcakes',
    description: 'Biscoff cupcake recipe is a real game changer',
    ingredients:
        '200g Unsalted butter (softened)\n\n350g Dark chocolate\n\n3 Free range medium eggs\n\n250g Billington\'s Unrefined Dark Muscovado Sugar\n\n50g Allinson\'s Self-Raising White Flour',
    recipe:
        'Get ready for the ultimate chocolate brownies. We use Billington’s Unrefined Dark Muscovado Sugar, and believe us when we say these make the most indulgently-rich and gooey chocolate brownies you\'ve ever tasted. You\'ll never look at another brownie the same way.\n\nOnce you’ve mastered this recipe, you can go wild exploring new flavour combos. Try adding Caramac or Biscoff spread to add a new twist - we\'ve shown you how to amend the recipe below.\n\nCaramac lovers: Break 6x 30g bars into the brownie mix right before baking. Once baked, drizzle a melted 30g bar over the top.\n\nBonkers for Biscoff? Dollop 200g Biscoff spread into the brownie mix, right before baking. Break up 5 Biscoff biscuits and place the pieces on top of the brownie batter. Bake for 20 minutes extra.',
    image: 'recipe3',
  ),
];
