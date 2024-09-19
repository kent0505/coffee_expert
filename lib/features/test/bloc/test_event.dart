part of 'test_bloc.dart';

abstract class TestEvent {}

class GetTestEvent extends TestEvent {}

class AddTestEvent extends TestEvent {
  final TestModel model;
  AddTestEvent({required this.model});
}

class EditTestEvent extends TestEvent {
  final TestModel model;
  EditTestEvent({required this.model});
}

class DeleteTestEvent extends TestEvent {
  final int id;
  DeleteTestEvent({required this.id});
}
