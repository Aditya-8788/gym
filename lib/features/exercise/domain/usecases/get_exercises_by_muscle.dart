import '../entities/exercise.dart';
import '../repositories/exercise_repository.dart';

class GetExercisesByMuscle {
  const GetExercisesByMuscle(this.repository);

  final ExerciseRepository repository;

  Future<List<ExerciseEntity>> call(String muscle) {
    return repository.getExercisesByMuscle(muscle);
  }
}
