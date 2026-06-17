// import 'package:flutter/material.dart';
// import 'package:gym/features/exercise/data/models/exercise_model.dart';

// class ExercisePage extends StatelessWidget {

//   final ExerciseModel exercise;

//   const ExercisePage({
//     super.key,
//     required this.exercise,
//   });

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(

//       appBar: AppBar(
//         title: Text(exercise.name, style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255,),
//         fontWeight: FontWeight.bold,
//         fontSize: 25),),
//       ),

//       body: SingleChildScrollView(

//         //padding: const EdgeInsets.all(16),

//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 20,
//             width: double.infinity,),

//             SizedBox(
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Body Part: ${exercise.bodyPart}", style: const TextStyle(fontSize: 20,color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.w500),),
//                     const SizedBox(height: 6),
//                     Text("Target: ${exercise.target}", style: const TextStyle(fontSize: 20,color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.w500),),
//                     const SizedBox(height: 6),
//                     Text("Equipment: ${exercise.equipment}", style: const TextStyle(fontSize: 20,color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.w500),),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             Padding(
//               padding: const EdgeInsets.only(left: 16.0),
//               child: const Text(
//                 "Instructions",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Color.fromARGB(255, 0, 0, 0),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 10),

//             exercise.instructions.isEmpty? const Text("No instructions available", style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),)
//             : Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: exercise.instructions.map(
//                 (step) {
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 8, left: 16.0, right: 10.0),
//                     child: Text("• $step", style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),),
//                   );
//                 }
//               ).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gym/core/widgets/fade_slide_animation.dart';
import 'package:gym/features/exercise/data/models/exercise_model.dart';

class ExercisePage extends StatelessWidget {
  final ExerciseModel exercise;

  const ExercisePage({
    super.key,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          exercise.name,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeSlideAnimation(
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(18.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      infoRow("Body Part", exercise.bodyPart),
                      infoRow("Target", exercise.target),
                      infoRow("Equipment", exercise.equipment),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              "Instructions",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 12.h),
            if (exercise.instructions.isEmpty)
              Text(
                "No instructions available",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black54,
                ),
              )
            else
              ...exercise.instructions.asMap().entries.map(
                    (entry) => FadeSlideAnimation(
                      delay: entry.key * 80,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 12.h),
                        padding: EdgeInsets.all(14.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orange.withOpacity(0.12),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 14.r,
                              backgroundColor: Colors.deepOrange,
                              child: Text(
                                "${entry.key + 1}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Text(
                                entry.value,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.black87,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget infoRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}