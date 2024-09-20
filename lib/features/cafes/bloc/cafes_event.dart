part of 'cafes_bloc.dart';

abstract class CafesEvent {}

class GetCafesEvent extends CafesEvent {}

class AddCafesEvent extends CafesEvent {
  final Cafe cafe;
  AddCafesEvent({required this.cafe});
}

class EditCafesEvent extends CafesEvent {
  final Cafe cafe;
  EditCafesEvent({required this.cafe});
}

class DeleteCafesEvent extends CafesEvent {
  final int id;
  DeleteCafesEvent({required this.id});
}
