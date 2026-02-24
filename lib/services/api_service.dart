// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/exercise_model.dart';

// class ApiService {
//   static const String apiKey = "https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/dist/exercises.json"; // Replace with your actual API key

//   // static Future<List<Exercise>> fetchExercisesByMuscle(String muscle) async {
//   //   final response = await http.get(
//   //     Uri.parse(
//   //         "https://exercisedb.p.rapidapi.com/exercises/target/$muscle"),
//   //     headers: {
//   //       "X-RapidAPI-Key": apiKey,
//   //       "X-RapidAPI-Host": "exercisedb.p.rapidapi.com"
//   //     },
//   //   );
//         static Future<List<Exercise>> fetchExercisesByMuscle(String muscle) async {
//           final response = await http.get(
//            Uri.parse(
//              apiKey.replaceAll("exercises.json", "exercises/target/$muscle")
//               ),
//         //     headers: {
//         //       "X-RapidAPI-Key": apiKey,
//         //       "X-RapidAPI-Host": "exercisedb.p.rapidapi.com"
//         //  },
//         );

//       print("Status Code: ${response.statusCode}");
//       print("Response Body: ${response.body}");

//        if (response.statusCode == 200) {
//        List data = jsonDecode(response.body);
//       return data.map((e) => Exercise.fromJson(e)).toList();
//       } else {
//       throw Exception("Failed to load exercises");
//     }
//   }
// }
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
      List filtered = data.where((exercise) {
        List muscles = exercise["primaryMuscles"];
        return muscles.contains(muscle.toLowerCase());
      }).toList();

      return filtered.map((e) => Exercise.fromJson(e)).toList();

    } else {
      throw Exception("Failed to load exercises");
    }
  }
}

    
