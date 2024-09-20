import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/db/db.dart';
import '../../../core/models/recipe.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  RecipesBloc() : super(RecipesInitial()) {
    on<GetRecipesEvent>((event, emit) async {
      if (DB.recipesList.isEmpty) {
        await getRecipes();
        emit(RecipesLoadedState(recipes: DB.recipesList));
      } else {
        emit(RecipesLoadedState(recipes: DB.recipesList));
      }
    });

    on<AddRecipesEvent>((event, emit) async {
      DB.recipesList.add(event.recipe);
      await updateRecipes();
      emit(RecipesLoadedState(recipes: DB.recipesList));
    });

    on<EditRecipesEvent>((event, emit) async {
      for (Recipe recipe in DB.recipesList) {
        if (recipe.id == event.recipe.id) {
          recipe.title = event.recipe.title;
          recipe.description = event.recipe.description;
          recipe.ingredients = event.recipe.ingredients;
          recipe.recipe = event.recipe.recipe;
          recipe.image = event.recipe.image;
        }
      }
      await updateRecipes();
      emit(RecipesLoadedState(recipes: DB.recipesList));
    });

    on<DeleteRecipesEvent>((event, emit) async {
      DB.recipesList.removeWhere((element) => element.id == event.id);
      await updateRecipes();
      emit(RecipesLoadedState(recipes: DB.recipesList));
    });
  }
}
