// import 'package:flutter/material.dart';
// import 'muscle_page.dart';

// class SpecificMusclePage extends StatelessWidget {

//   final String muscle;

//   const SpecificMusclePage({super.key, required this.muscle});

//   @override
//   Widget build(BuildContext context) {

//     List<String> subMuscles = [];

//     if (muscle == "Chest") {
//       subMuscles = ["chest"];
//     }
//     else if (muscle == "Back") {
//       subMuscles = ["lats"];
//     }
//     else if (muscle == "Biceps") {
//       subMuscles = ["biceps"];
//     }
//     else if (muscle == "Triceps") {
//       subMuscles = ["triceps"];
//     }
//     else if (muscle == "Legs") {
//       subMuscles = ["quadriceps", "hamstrings", "calves"];
//     }
//     else if (muscle == "Shoulders") {
//       subMuscles = ["delts"];
//     }
//     else if (muscle == "Abs") {
//       subMuscles = ["abs"];
//     }

//     return Scaffold(

//       appBar: AppBar(title: Text(muscle,
//       style: const TextStyle(
//         fontSize: 25,
//         fontWeight: FontWeight.bold,
//         color: Color.fromARGB(255, 255, 255, 255),
//       ),),),
      

//       body: Column(
//         children: [
//           SizedBox(height: 20,),
//           SizedBox(
//             height: 500,
//             child: ListView.builder(
            
//               itemCount: subMuscles.length,
            
//               itemBuilder: (context, index) {
            
//                 return ListTile(
            
//                   title: Text("${index + 1}. ${subMuscles[index]}",
//                   style: TextStyle(
//                     fontSize: 23,
//                     fontWeight: FontWeight.bold,
//                     color: const Color.fromARGB(255, 0, 0, 0),
//                     ),
//                     ),
            
//                   trailing: const Icon(Icons.arrow_forward),
//                   iconColor: Colors.black,
            
//                   onTap: () {
            
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) =>
//                             MusclePage(muscle: subMuscles[index]),
//                       ),
//                     );
            
//                   },
//                 );
            
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gym/core/widgets/fade_slide_animation.dart';
import 'package:gym/features/exercise/presentation/pages/muscle_page.dart';

class SpecificMusclePage extends StatelessWidget {
  final String muscle;

  const SpecificMusclePage({
    super.key,
    required this.muscle,
  });

  List<String> getSubMuscles() {
    if (muscle == "Chest") return ["chest"];
    if (muscle == "Back") return ["lats"];
    if (muscle == "Biceps") return ["biceps"];
    if (muscle == "Triceps") return ["triceps"];
    if (muscle == "Legs") return ["quadriceps", "hamstrings", "calves"];
    if (muscle == "Shoulders") return ["delts"];
    if (muscle == "Abs") return ["abs"];
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final subMuscles = getSubMuscles();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          muscle,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20.w),
        itemCount: subMuscles.length,
        itemBuilder: (context, index) {
          return FadeSlideAnimation(
            delay: index * 100,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(18.w),
                leading: CircleAvatar(
                  backgroundColor: Colors.orange.withOpacity(0.15),
                  child: Text(
                    "${index + 1}",
                    style: const TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  subMuscles[index].toUpperCase(),
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.deepOrange,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MusclePage(
                        muscle: subMuscles[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}