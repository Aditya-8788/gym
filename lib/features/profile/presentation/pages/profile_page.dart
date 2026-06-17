// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../bloc/profile_bloc.dart';
// import '../bloc/profile_event.dart';
// import '../bloc/profile_state.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final weightController = TextEditingController();
//   final heightController = TextEditingController();

//   @override
//   void dispose() {
//     weightController.dispose();
//     heightController.dispose();
//     super.dispose();
//   }

//   void saveProfile() {
//     final weight = double.tryParse(weightController.text.trim());
//     final height = double.tryParse(heightController.text.trim());

//     if (weight == null || height == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Enter valid weight and height")),
//       );
//       return;
//     }

//     context.read<ProfileBloc>().add(
//           SaveProfileRequested(
//             weight: weight,
//             height: height,
//           ),
//         );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<ProfileBloc, ProfileState>(
//       listener: (context, state) {
//         if (state is ProfileSaved) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text("BMI saved successfully")),
//           );
//         }

//         if (state is ProfileError) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(state.message)),
//           );
//         }
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("BMI Calculator"),
//         ),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.all(25),
//           child: Column(
//             children: [
//               const Icon(
//                 Icons.health_and_safety,
//                 size: 90,
//                 color: Colors.orange,
//               ),

//               const SizedBox(height: 30),

//               TextField(
//                 controller: weightController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   labelText: "Enter Weight",
//                   suffixText: "kg",
//                   prefixIcon: const Icon(Icons.monitor_weight),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               TextField(
//                 controller: heightController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   labelText: "Enter Height",
//                   suffixText: "cm",
//                   prefixIcon: const Icon(Icons.height),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 30),

//               BlocBuilder<ProfileBloc, ProfileState>(
//                 builder: (context, state) {
//                   return SizedBox(
//                     height: 55,
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: state is ProfileLoading ? null : saveProfile,
//                       child: state is ProfileLoading
//                           ? const CircularProgressIndicator(
//                               color: Colors.white,
//                             )
//                           : const Text(
//                               "Calculate & Save BMI",
//                               style: TextStyle(fontSize: 18),
//                             ),
//                     ),
//                   );
//                 },
//               ),

//               const SizedBox(height: 30),

//               BlocBuilder<ProfileBloc, ProfileState>(
//                 builder: (context, state) {
//                   if (state is ProfileSaved) {
//                     return Card(
//                       child: Padding(
//                         padding: const EdgeInsets.all(20),
//                         child: Column(
//                           children: [
//                             const Text(
//                               "Your BMI",
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             Text(
//                               state.bmi.toStringAsFixed(2),
//                               style: const TextStyle(
//                                 fontSize: 35,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.orange,
//                               ),
//                             ),
//                             Text(
//                               state.bmiCategory,
//                               style: const TextStyle(
//                                 fontSize: 20,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   }

//                   return const SizedBox();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gym/core/widgets/app_text_field.dart';
import 'package:gym/core/widgets/fade_slide_animation.dart';
import 'package:gym/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:gym/features/profile/presentation/bloc/profile_event.dart';
import 'package:gym/features/profile/presentation/bloc/profile_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  void saveProfile() {
    final weight = double.tryParse(weightController.text.trim());
    final height = double.tryParse(heightController.text.trim());

    if (weight == null || height == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter valid weight and height")),
      );
      return;
    }

    context.read<ProfileBloc>().add(
          SaveProfileRequested(
            weight: weight,
            height: height,
          ),
        );
  }

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSaved) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("BMI saved successfully")),
          );
        } else if (state is ProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile & BMI",
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(24.w),
          child: FadeSlideAnimation(
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  children: [
                    Container(
                      height: 90.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.health_and_safety,
                        size: 46.sp,
                        color: Colors.deepOrange,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "BMI Calculator",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Enter your weight and height",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    AppTextField(
                      controller: weightController,
                      label: "Weight KG",
                      icon: Icons.monitor_weight,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 18.h),
                    AppTextField(
                      controller: heightController,
                      label: "Height CM",
                      icon: Icons.height,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 26.h),
                    BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        return SizedBox(
                          height: 55.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed:
                                state is ProfileLoading ? null : saveProfile,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.r),
                              ),
                            ),
                            child: state is ProfileLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Calculate & Save",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 26.h),
                    BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        if (state is ProfileSaved) {
                          return Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(20.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              gradient: const LinearGradient(
                                colors: [Colors.orange, Colors.deepOrange],
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Your BMI",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  state.bmi.toStringAsFixed(2),
                                  style: TextStyle(
                                    fontSize: 36.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  state.bmiCategory,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        return const SizedBox();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}