// import 'package:flutter/material.dart';
// import 'package:gym/features/exercise/data/models/exercise_model.dart';
// import 'package:gym/features/exercise/data/datasources/exercise_remote_datasource.dart';
// import 'exercise_page.dart';

// class MusclePage extends StatelessWidget {

//   final String muscle;

//   const MusclePage({super.key, required this.muscle});

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(

//       appBar: AppBar(
//         title: Text(muscle.toUpperCase(),style: TextStyle(
//           fontSize: 25,
//           fontWeight: FontWeight.bold,
//           color: const Color.fromARGB(255, 255, 255, 255),
//         ),),
//       ),

//       body: FutureBuilder<List<ExerciseModel>>(

//         future: ExerciseRemoteDataSource().getExercisesByMuscle(muscle),

//         builder: (context, exercises) {

//           if (exercises.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (exercises.hasError) {
//             return Center(
//               child: Text(exercises.error.toString()),
//             );
//           }

//           if (exercises.data?.isEmpty ?? true) {
//             return const Center(child: Text("No exercises found"));
//           }

//           return ListView.builder(

//             itemCount: exercises.data?.length ?? 0,

//             itemBuilder: (context, index) {

//               final exercise = exercises.data![index];

//               return Card(
//                 margin: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 8,
//                 ),
//                 child: ListTile(
//                 contentPadding: const EdgeInsets.all(12),
//                 title: Text(
//                   exercise.name,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                     color: Color.fromARGB(255, 0, 0, 0),
//                     ),
//                   ),
//                   subtitle: Text("Equipment: ${exercise.equipment}",style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
//                   trailing: const Icon(Icons.arrow_forward_ios, size: 16),iconColor: const Color.fromARGB(255, 0, 0, 0),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => ExercisePage(exercise: exercise),
//                       ),
//                     );
//                   },
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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gym/core/widgets/fade_slide_animation.dart';
import 'package:gym/features/exercise/presentation/bloc/exercise_bloc.dart';
import 'package:gym/features/exercise/presentation/bloc/exercise_event.dart';
import 'package:gym/features/exercise/presentation/bloc/exercise_state.dart';
import 'package:gym/features/exercise/presentation/pages/exercise_page.dart';

class MusclePage extends StatefulWidget {
  final String muscle;

  const MusclePage({
    super.key,
    required this.muscle,
  });

  @override
  State<MusclePage> createState() => _MusclePageState();
}

class _MusclePageState extends State<MusclePage> {
  @override
  void initState() {
    super.initState();
    context.read<ExerciseBloc>().add(
          FetchExercisesRequested(widget.muscle),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.muscle.toUpperCase(),
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<ExerciseBloc, ExerciseState>(
        builder: (context, state) {
          if (state is ExerciseLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.deepOrange),
            );
          }

          if (state is ExerciseError) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16.sp,
                ),
              ),
            );
          }

          if (state is ExerciseLoaded) {
            if (state.exercises.isEmpty) {
              return Center(
                child: Text(
                  "No exercises found",
                  style: TextStyle(fontSize: 16.sp),
                ),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: state.exercises.length,
              itemBuilder: (context, index) {
                final exercise = state.exercises[index];

                return FadeSlideAnimation(
                  delay: index * 60,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(14.w),
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange.withOpacity(0.15),
                        child: const Icon(
                          Icons.fitness_center,
                          color: Colors.deepOrange,
                        ),
                      ),
                      title: Text(
                        exercise.name,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        "Equipment: ${exercise.equipment}",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.black54,
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
                            builder: (_) => ExercisePage(
                              exercise: exercise,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}