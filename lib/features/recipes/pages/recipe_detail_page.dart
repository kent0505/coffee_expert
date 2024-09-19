import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/recipe.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      home: true,
      recipe: true,
      body: Column(
        children: [
          const CustomAppbar(title: 'Recipe'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(height: 12),
                CustomImage(
                  image: recipe.image,
                  height: 240,
                  borderRadius: 24,
                ),
                const SizedBox(height: 20),
                TextB(
                  recipe.title,
                  fontSize: 20,
                  color: AppColors.main,
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.card1,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextM(
                        'Ingredients',
                        fontSize: 14,
                        color: AppColors.text3,
                      ),
                      const SizedBox(height: 16),
                      TextM(
                        recipe.ingredients,
                        fontSize: 14,
                        maxLines: 100,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                TextM(
                  recipe.recipe,
                  fontSize: 14,
                  maxLines: 200,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
