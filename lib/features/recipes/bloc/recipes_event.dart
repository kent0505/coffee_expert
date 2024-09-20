part of 'recipes_bloc.dart';

abstract class RecipesEvent {}

class GetRecipesEvent extends RecipesEvent {}

class AddRecipesEvent extends RecipesEvent {
  final Recipe recipe;
  AddRecipesEvent({required this.recipe});
}

class EditRecipesEvent extends RecipesEvent {
  final Recipe recipe;
  EditRecipesEvent({required this.recipe});
}

class DeleteRecipesEvent extends RecipesEvent {
  final int id;
  DeleteRecipesEvent({required this.id});
}
