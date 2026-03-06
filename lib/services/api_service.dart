import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/exercise_model.dart';

class ApiService {

  static const String url =
      "https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/dist/exercises.json";

  static Future<List<Exercise>> fetchExercisesByMuscle(String muscle) async {

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {

      List data = jsonDecode(response.body);

      // filter exercises by muscle
      return data
    .where((exercise) =>
        exercise["primaryMuscles"].contains(muscle.toLowerCase()))
    .map((e) => Exercise.fromJson(e))
    .toList();
    } else {
      throw Exception("Failed to load exercises");
    }
  }
}

    
