part of 'test_bloc.dart';

abstract class TestState {}

class TestInitial extends TestState {}

class TestLoadedState extends TestState {
  final List<TestModel> models;
  TestLoadedState({required this.models});
}
