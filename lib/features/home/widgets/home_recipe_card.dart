import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/config/router.dart';
import '../../../core/models/recipe.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../core/widgets/texts/text_r.dart';

class HomeRecipeCard extends StatelessWidget {
  const HomeRecipeCard({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      height: 220,
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        color: AppColors.card1,
        borderRadius: BorderRadius.circular(24),
      ),
      child: CupertinoButton(
        onPressed: () {
          context.push(Routes.recipeDetail, extra: recipe);
        },
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImage(
              image: recipe.image,
              height: 118,
              borderRadius: 14,
            ),
            const Spacer(),
            TextE(
              recipe.title,
              fontSize: 14,
              maxLines: 2,
            ),
            Row(
              children: [
                Expanded(
                  child: TextM(
                    recipe.description,
                    fontSize: 12,
                    color: AppColors.white48,
                  ),
                ),
                const SizedBox(width: 10),
                SvgPicture.asset('assets/arrow-right.svg'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
