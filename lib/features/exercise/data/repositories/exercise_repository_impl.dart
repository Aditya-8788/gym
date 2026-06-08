import '../../domain/entities/exercise.dart';
import '../../domain/repositories/exercise_repository.dart';
import '../datasources/exercise_remote_datasource.dart';

class ExerciseRepositoryImpl implements ExerciseRepository {
  ExerciseRepositoryImpl({ExerciseRemoteDataSource? dataSource})
      : _dataSource = dataSource ?? ExerciseRemoteDataSource();

  final ExerciseRemoteDataSource _dataSource;

  @override
  Future<List<ExerciseEntity>> getExercisesByMuscle(String muscle) async {
    final exercises = await _dataSource.getExercisesByMuscle(muscle);
    return exercises
        .map(
          (exercise) => ExerciseEntity(
            name: exercise.name,
            bodyPart: exercise.bodyPart,
            equipment: exercise.equipment,
            target: exercise.target,
            gifUrl: exercise.gifUrl,
            instructions: exercise.instructions,
          ),
        )
        .toList();
  }
}
