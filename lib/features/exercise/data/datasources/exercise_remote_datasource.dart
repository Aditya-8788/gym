import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/exercise_model.dart';

class ExerciseRemoteDataSource {
  static const String url =
      'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/dist/exercises.json';

  Future<List<ExerciseModel>> getExercisesByMuscle(String muscle) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to load exercises');
    }

    final List data = jsonDecode(response.body);

    return data
        .where((exercise) =>
            (exercise['primaryMuscles'] as List).contains(muscle.toLowerCase()))
        .map((e) => ExerciseModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

    
