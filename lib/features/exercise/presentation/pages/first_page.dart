// import 'package:flutter/material.dart';
// import 'package:gym/features/profile/presentation/pages/profile_page.dart';
// import 'specific_muscle_page.dart';

// class FirstPage extends StatelessWidget {
//   const FirstPage({super.key});

//   final List<String> muscles = const [
//     "Chest",
//     "Back",
//     "Biceps",
//     "Triceps",
//     "Legs",
//     "Shoulders",
//     "Abs"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Select Muscle"),titleTextStyle: TextStyle(
//           fontSize: 25,
//           fontWeight: FontWeight.bold,
//           color: const Color.fromARGB(255, 255, 255, 255),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(30),
//         child: GridView.builder(
//           itemCount: muscles.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 16,
//             mainAxisSpacing: 16,
//             childAspectRatio: 1,
//           ),
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SpecificMusclePage(muscle: muscles[index]),
//                     // builder: (_) =>
//                     //     SpecificMusclePage(muscle: muscles[index]),
//                   ),
//                 );
//               },
//               child: Container(
//                 margin: const EdgeInsets.symmetric(
//                   horizontal: 6,
//                   vertical: 5,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.orangeAccent,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: const Color.fromARGB(255, 112, 112, 112),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                       offset: const Offset(5, 3),
//                     ),
//                   ],
//                 ),
//                 child: Center(
//                   child: Text(
//                     muscles[index],
//                     style: const TextStyle(
//                       fontSize: 23,
//                       fontWeight: FontWeight.bold,
//                       color: Color.fromARGB(255, 0, 0, 0),
//                       backgroundColor: Colors.orangeAccent,
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 0,
//   onTap: (index) {

//     if (index == 2) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (_) => const ProfilePage(),
//         ),
//       );
//     }

//   },
//   items: const [
//     BottomNavigationBarItem(
//       icon: Icon(Icons.home),
//       label: 'Home',
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(Icons.fitness_center),
//       label: 'Exercises',
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(Icons.person),
//       label: 'Profile',
//     ),
//   ],
// ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gym/core/widgets/fade_slide_animation.dart';
import 'package:gym/features/exercise/presentation/pages/specific_muscle_page.dart';
import 'package:gym/features/profile/presentation/pages/profile_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  final List<String> muscles = const [
    "Chest",
    "Back",
    "Biceps",
    "Triceps",
    "Legs",
    "Shoulders",
    "Abs",
  ];

  final List<IconData> icons = const [
    Icons.accessibility_new,
    Icons.fitness_center,
    Icons.sports_gymnastics,
    Icons.sports_mma,
    Icons.directions_run,
    Icons.sports_handball,
    Icons.self_improvement,
  ];

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Muscle",
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: GridView.builder(
          itemCount: muscles.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isTablet ? 3 : 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return FadeSlideAnimation(
              delay: index * 80,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SpecificMusclePage(
                        muscle: muscles[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22.r),
                    gradient: const LinearGradient(
                      colors: [Colors.orange, Colors.deepOrange],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.35),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icons[index],
                        size: 42.sp,
                        color: Colors.white,
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        muscles[index],
                        style: TextStyle(
                          fontSize: 21.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfilePage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: "Exercises",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}