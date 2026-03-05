// import 'package:flutter/material.dart';
// import 'specific_muscle_page.dart';

// class MusclePage extends StatelessWidget {
//   const MusclePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Select Muscle")),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
          
//               Row(
//                 children: [
//                   muscleButton(context, "Biceps"),
//                   muscleButton(context, "Triceps"),
//                 ],
          
//               ),
//                Row(
//                 children: [
//                   muscleButton(context, "Chest"),
//                   muscleButton(context, "Abs"),
//                 ],
          
//               ),
//                Row(
//                 children: [
//                   muscleButton(context, "Back"),
//                   muscleButton(context, "Shoulders"),
//                 ],
          
//               ),
//                Row(
//                 children: [
//                   muscleButton(context, "Legs"),
                  
//                 ],
          
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget muscleButton(BuildContext context, String muscleName) {
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: SizedBox(
//         width: 185,
//         height: 80,
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => SpecificMusclePage(muscle: muscleName),
//               ),
//             );
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.deepOrangeAccent,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//           child: Text(muscleName, style: const TextStyle(fontSize: 18)),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'models/exercise_model.dart';
import 'services/api_service.dart';
import 'exercise_page.dart';

class MusclePage extends StatelessWidget {

  final String muscle;

  const MusclePage({super.key, required this.muscle});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(muscle.toUpperCase()),
      ),

      body: FutureBuilder<List<Exercise>>(

        future: ApiService.fetchExercisesByMuscle(muscle),

        builder: (context, exercises) {

          if (exercises.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (exercises.hasError) {
            return Center(
              child: Text(exercises.error.toString()),
            );
          }

          if (exercises.data?.isEmpty ?? true) {
            return const Center(child: Text("No exercises found"));
          }

          return ListView.builder(

            itemCount: exercises.data?.length ?? 0,

            itemBuilder: (context, index) {

              final exercise = exercises.data![index];

              return Card(
  margin: const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 8,
  ),
  child: ListTile(
    contentPadding: const EdgeInsets.all(12),
    title: Text(
      exercise.name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    subtitle: Text("Equipment: ${exercise.equipment}"),
    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ExercisePage(exercise: exercise),
        ),
      );
    },
  ),
);
            },
          );
        },
      ),
    );
  }
}