// import 'package:flutter/material.dart';
// import 'exercise_page.dart';

// class SpecificMusclePage extends StatelessWidget {
//   final String muscle;

//   const SpecificMusclePage({super.key, required this.muscle});

//   @override
//   Widget build(BuildContext context) {
//     List<String> subMuscles = [];

//     if (muscle == "Back") {
//       subMuscles = ["Upper Back", "Lower Back", "Lats"];
//     } else if (muscle == "Chest") {
//       subMuscles = ["Upper Chest", "Middle Chest", "Lower Chest"];
//     } else if (muscle == "Legs") {
//       subMuscles = ["Quads", "Hamstrings", "Calves"];
//     }

//     return Scaffold(
//       appBar: AppBar(title: Text(muscle)),
//       body: ListView.builder(
//         itemCount: subMuscles.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(subMuscles[index]),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                       ExercisePage(subMuscle: subMuscles[index]),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'muscle_page.dart';

class SpecificMusclePage extends StatelessWidget {

  final String muscle;

  const SpecificMusclePage({super.key, required this.muscle});

  @override
  Widget build(BuildContext context) {

    List<String> subMuscles = [];

    if (muscle == "Chest") {
      subMuscles = ["chest"];
    }
    else if (muscle == "Back") {
      subMuscles = ["lats"];
    }
    else if (muscle == "Biceps") {
      subMuscles = ["biceps"];
    }
    else if (muscle == "Triceps") {
      subMuscles = ["triceps"];
    }
    else if (muscle == "Legs") {
      subMuscles = ["quadriceps", "hamstrings", "calves"];
    }
    else if (muscle == "Shoulders") {
      subMuscles = ["delts"];
    }
    else if (muscle == "Abs") {
      subMuscles = ["abs"];
    }

    return Scaffold(

      appBar: AppBar(title: Text(muscle)),

      body: ListView.builder(

        itemCount: subMuscles.length,

        itemBuilder: (context, index) {

          return ListTile(

            title: Text(subMuscles[index]),

            trailing: const Icon(Icons.arrow_forward),

            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      MusclePage(muscle: subMuscles[index]),
                ),
              );

            },
          );

        },
      ),
    );
  }
}