import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/exercise_model.dart';

class ApiService {
  static const String apiKey = "aa1f71a522msh3403c487b820e93p16a11ejsn686fccc08e59"; // Replace with your actual API key

  // static Future<List<Exercise>> fetchExercisesByMuscle(String muscle) async {
  //   final response = await http.get(
  //     Uri.parse(
  //         "https://exercisedb.p.rapidapi.com/exercises/target/$muscle"),
  //     headers: {
  //       "X-RapidAPI-Key": apiKey,
  //       "X-RapidAPI-Host": "exercisedb.p.rapidapi.com"
  //     },
  //   );
        static Future<List<Exercise>> fetchExercisesByMuscle(String muscle) async {
          final response = await http.get(
           Uri.parse(
              "https://exercisedb.p.rapidapi.com/exercises/target/$muscle"),
           headers: {
           "X-RapidAPI-Key": apiKey,
           "X-RapidAPI-Host": "exercisedb.p.rapidapi.com"
         },
        );

      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

       if (response.statusCode == 200) {
       List data = jsonDecode(response.body);
      return data.map((e) => Exercise.fromJson(e)).toList();
      } else {
      throw Exception("Failed to load exercises");
    }
  }
}

    
