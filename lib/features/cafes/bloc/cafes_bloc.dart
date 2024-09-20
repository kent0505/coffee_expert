import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/db/db.dart';
import '../../../core/models/cafe.dart';

part 'cafes_event.dart';
part 'cafes_state.dart';

class CafesBloc extends Bloc<CafesEvent, CafesState> {
  CafesBloc() : super(CafesInitial()) {
    on<GetCafesEvent>((event, emit) async {
      if (DB.cafesList.isEmpty) {
        await getCafes();
        emit(CafesLoadedState(cafes: DB.cafesList));
      } else {
        emit(CafesLoadedState(cafes: DB.cafesList));
      }
    });

    on<AddCafesEvent>((event, emit) async {
      DB.cafesList.add(event.cafe);
      await updateCafes();
      emit(CafesLoadedState(cafes: DB.cafesList));
    });

    on<EditCafesEvent>((event, emit) async {
      for (Cafe cafe in DB.cafesList) {
        if (cafe.id == event.cafe.id) {
          cafe.title = event.cafe.title;
          cafe.description = event.cafe.description;
          cafe.image = event.cafe.image;
        }
      }
      await updateCafes();
      emit(CafesLoadedState(cafes: DB.cafesList));
    });

    on<DeleteCafesEvent>((event, emit) async {
      DB.cafesList.removeWhere((element) => element.id == event.id);
      await updateCafes();
      emit(CafesLoadedState(cafes: DB.cafesList));
    });
  }
}
