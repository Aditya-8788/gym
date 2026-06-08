import 'package:bloc/bloc.dart';
import 'package:gym/features/exercise/data/datasources/exercise_remote_datasource.dart';

import 'exercise_event.dart';
import 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseRemoteDataSource remoteDataSource;

  ExerciseBloc({
    required this.remoteDataSource,
  }) : super(ExerciseInitial()) {
    on<FetchExercisesRequested>(_onFetchExercisesRequested);
  }

  Future<void> _onFetchExercisesRequested(
    FetchExercisesRequested event,
    Emitter<ExerciseState> emit,
  ) async {
    emit(ExerciseLoading());

    try {
      final exercises = await remoteDataSource.getExercisesByMuscle(
        event.muscleName,
      );

      emit(ExerciseLoaded(exercises));
    } catch (e) {
      emit(ExerciseError(e.toString()));
    }
  }
}