// import 'package:flutter/material.dart';
// import 'package:gym/features/auth/presentation/pages/login_page.dart';

// class StartingPage extends StatelessWidget {
//   const StartingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(height: 150),

//             Text(
//               'Welcome to My App',
//               style: TextStyle(
//                 fontSize: 35,
//                 fontWeight: FontWeight.w900,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(height: 40),
//             SizedBox(height: 50),
//             Text(
//               "dataBuild strength. Build discipline.Results start with consistency.Learn exercises. Understand muscles.Train smarter for better results.",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w400,
//                 color: const Color.fromARGB(255, 0, 0, 0),
//               ),
//             ),
//             SizedBox(height: 50),
//             SizedBox(
//               height: 60,
//               width: 300,

//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => Loginpage()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepOrangeAccent,
//                   minimumSize: const Size(40, 50),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child: Text(
//                   'Get Started',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w600,
//                     color: const Color.fromARGB(255, 255, 255, 255),
//                   ),
//                 ),
//               ),
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
import 'package:gym/features/auth/presentation/pages/login_page.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            children: [
              const Spacer(),
              FadeSlideAnimation(
                child: Container(
                  height: 130.h,
                  width: 130.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Colors.orange, Colors.deepOrange],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.4),
                        blurRadius: 25,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.fitness_center,
                    color: Colors.white,
                    size: 65.sp,
                  ),
                ),
              ),
              SizedBox(height: 35.h),
              FadeSlideAnimation(
                delay: 100,
                child: Text(
                  "Gym Guide",
                  style: TextStyle(
                    fontSize: 38.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              FadeSlideAnimation(
                delay: 200,
                child: Text(
                  "Build strength. Learn exercises.\nTrack your fitness progress.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
              ),
              const Spacer(),
              FadeSlideAnimation(
                delay: 300,
                child: SizedBox(
                  height: 58.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const Loginpage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}