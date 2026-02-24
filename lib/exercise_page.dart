// import 'package:flutter/material.dart';

// class ExercisePage extends StatelessWidget {
//   final String subMuscle;

//   const ExercisePage({super.key, required this.subMuscle});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(subMuscle)),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [

//             Text(
//               "How to perform exercise for $subMuscle",
//               style: const TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//             const SizedBox(height: 20),

//             const Text(
//               "1. Warm up properly.\n"
//               "2. Maintain correct posture.\n"
//               "3. Control the movement.\n"
//               "4. Breathe properly.\n"
//               "5. Avoid jerky motions.",
//               style: TextStyle(fontSize: 16),
//             ),

//             const SizedBox(height: 20),

//             const Text(
//               "Tip: Start with light weight and focus on form.",
//               style: TextStyle(color: Colors.orange),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'models/exercise_model.dart';

class ExercisePage extends StatelessWidget {
  final Exercise exercise;

  const ExercisePage({super.key, required this.exercise, required String subMuscle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exercise.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(exercise.gifUrl),
            const SizedBox(height: 20),
            Text("Body Part: ${exercise.bodyPart}"),
            Text("Target: ${exercise.target}"),
            Text("Equipment: ${exercise.equipment}"),
          ],
        ),
      ),
    );
  }
}
