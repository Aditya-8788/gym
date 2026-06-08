import '../entities/exercise.dart';

abstract class ExerciseRepository {
  Future<List<ExerciseEntity>> getExercisesByMuscle(String muscle);
}
