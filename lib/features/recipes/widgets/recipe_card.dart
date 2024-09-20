import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/config/router.dart';
import '../../../core/models/recipe.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../core/widgets/texts/text_r.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: AppColors.card1,
        borderRadius: BorderRadius.circular(24),
      ),
      child: CupertinoButton(
        onPressed: () {
          context.push(Routes.recipeDetail, extra: recipe);
        },
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            ClipRRect(
              child: CustomImage(
                image: recipe.image,
                height: 80,
                width: 120,
                borderRadius: 14,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextB(
                    recipe.title,
                    fontSize: 14,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10),
                  TextR(
                    recipe.description,
                    fontSize: 12,
                    color: AppColors.text3,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            SvgPicture.asset('assets/arrow-right.svg'),
          ],
        ),
      ),
    );
  }
}
