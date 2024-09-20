import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../../../core/config/router.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/settings_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../../recipes/bloc/recipes_bloc.dart';
import '../widgets/home_recipe_card.dart';
import '../widgets/home_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      home: true,
      body: Column(
        children: [
          SizedBox(height: 14 + getStatusBar(context)),
          const Row(
            children: [
              SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextB(
                      'Hello 👋 ',
                      fontSize: 20,
                      color: AppColors.text1,
                    ),
                    SizedBox(height: 8),
                    TextM(
                      'What do you want to do?',
                      fontSize: 14,
                      color: AppColors.text2,
                    ),
                  ],
                ),
              ),
              SettingsButton(),
              SizedBox(width: 24),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              const SizedBox(width: 24),
              const Expanded(
                child: TextE(
                  'Top Recipes 🔥',
                  fontSize: 14,
                  color: AppColors.text1,
                ),
              ),
              CupertinoButton(
                onPressed: () {
                  context.push(Routes.recipes);
                },
                padding: EdgeInsets.zero,
                minSize: 20,
                child: const TextB(
                  'View All',
                  fontSize: 14,
                  color: AppColors.main,
                ),
              ),
              const SizedBox(width: 24),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 220,
            child: BlocBuilder<RecipesBloc, RecipesState>(
              builder: (context, state) {
                if (state is RecipesLoadedState) {
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      const SizedBox(width: 24),
                      ...List.generate(
                        state.recipes.length,
                        (index) {
                          return HomeRecipeCard(
                            recipe: state.recipes[index],
                          );
                        },
                      ),
                      const SizedBox(width: 10),
                    ],
                  );
                }

                return Container();
              },
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: const [
                SizedBox(height: 15),
                HomeTile(
                  title: 'Coffee varieties',
                  description: 'Learn all about the different types of coffee',
                ),
                SizedBox(height: 14),
                HomeTile(
                  title: 'Popular cafes',
                  description:
                      'Famous coffee shops of the world with the best coffee',
                ),
                SizedBox(height: 14),
                HomeTile(
                  title: 'News',
                  description: 'The latest news from the world of coffee',
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
