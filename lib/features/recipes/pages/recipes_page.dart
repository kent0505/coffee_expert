import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/router.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/no_data.dart';
import '../widgets/recipe_card.dart';
import '../bloc/recipes_bloc.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const CustomAppbar(title: 'Recipes'),
              Expanded(
                child: BlocBuilder<RecipesBloc, RecipesState>(
                  builder: (context, state) {
                    if (state is RecipesLoadedState) {
                      if (state.recipes.isEmpty) return const NoData();

                      return ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        children: [
                          const SizedBox(height: 12),
                          ...List.generate(
                            state.recipes.length,
                            (index) {
                              return RecipeCard(
                                recipe: state.recipes[index],
                              );
                            },
                          ),
                          const SizedBox(height: 70 + 56 + 14),
                        ],
                      );
                    }

                    return Container();
                  },
                ),
              ),
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
