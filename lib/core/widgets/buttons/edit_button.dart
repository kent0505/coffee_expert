import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../../config/router.dart';
import '../../models/recipe.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key, this.recipe});

  final Recipe? recipe;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        context.push(Routes.editRecipe, extra: recipe);
      },
      padding: EdgeInsets.zero,
      minSize: 44,
      child: Container(
        height: 44,
        width: 44,
        decoration: const BoxDecoration(
          color: AppColors.main,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(
            Icons.edit_rounded,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
