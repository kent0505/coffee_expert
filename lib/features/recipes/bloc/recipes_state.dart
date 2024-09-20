part of 'recipes_bloc.dart';

abstract class RecipesState {}

class RecipesInitial extends RecipesState {}

class RecipesLoadedState extends RecipesState {
  final List<Recipe> recipes;
  RecipesLoadedState({required this.recipes});
}
