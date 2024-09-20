import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';

class HomeNoRecipes extends StatelessWidget {
  const HomeNoRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 24),
        Container(
          width: 156,
          height: 220,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.main,
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Center(
            child: TextE(
              'No data',
              fontSize: 14,
              maxLines: 2,
            ),
          ),
        ),
      ],
    );
  }
}
