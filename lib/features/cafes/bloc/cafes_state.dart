part of 'cafes_bloc.dart';

abstract class CafesState {}

class CafesInitial extends CafesState {}

class CafesLoadedState extends CafesState {
  final List<Cafe> cafes;
  CafesLoadedState({required this.cafes});
}
