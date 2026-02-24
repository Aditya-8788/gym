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
      appBar: AppBar(title: Text(muscle.toUpperCase())),
      body: FutureBuilder<List<Exercise>>(
        future: ApiService.fetchExercisesByMuscle(muscle),
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

         if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        }

          final exercises = snapshot.data!;

          return ListView.builder(
            itemCount: exercises.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(exercises[index].name),
                subtitle: Text("Equipment: ${exercises[index].equipment}"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      MusclePage(muscle: exercises[index].target.toLowerCase()),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}