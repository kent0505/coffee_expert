import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/db/db.dart';
import '../../../core/models/test_model.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestInitial()) {
    on<GetTestEvent>((event, emit) async {
      if (DB.modelsList.isEmpty) {
        await getModels();

        emit(TestLoadedState(models: DB.modelsList));
      } else {
        emit(TestLoadedState(models: DB.modelsList));
      }
    });

    on<AddTestEvent>((event, emit) async {
      // DB.modelsList.insert(0, event.test);
      DB.modelsList.add(event.model);
      await updateModels();

      emit(TestLoadedState(models: DB.modelsList));
    });

    on<EditTestEvent>((event, emit) async {
      for (TestModel test in DB.modelsList) {
        if (test.id == event.model.id) {
          test.title = event.model.title;
        }
      }
      await updateModels();

      emit(TestLoadedState(models: DB.modelsList));
    });

    on<DeleteTestEvent>((event, emit) async {
      DB.modelsList.removeWhere((element) => element.id == event.id);
      await updateModels();

      emit(TestLoadedState(models: DB.modelsList));
    });
  }
}
