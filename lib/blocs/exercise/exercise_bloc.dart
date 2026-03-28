import 'package:bloc/bloc.dart';
import '../../services/api_service.dart';
import 'exercise_event.dart';
import 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  ExerciseBloc() : super(ExerciseInitial()) {
    on<FetchExercisesRequested>(_onFetchExercisesRequested);
  }

  Future<void> _onFetchExercisesRequested(
    FetchExercisesRequested event,
    Emitter<ExerciseState> emit,
  ) async {
    emit(ExerciseLoading());
    try {
      final exercises = await ApiService.fetchExercisesByMuscle(event.muscleName);
      emit(ExerciseLoaded(exercises));
    } catch (e) {
      emit(ExerciseError(e.toString()));
    }
  }
}
