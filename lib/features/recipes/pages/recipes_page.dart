import 'package:flutter/material.dart';

import '../../../core/config/router.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          const Column(
            children: [
              CustomAppbar(title: 'Recipes'),
            ],
          ),
          PrimaryButton(
            title: 'Add New Recipe',
            bottom: true,
            onPressed: () {
              context.push(Routes.addRecipe);
            },
          ),
        ],
      ),
    );
  }
}
