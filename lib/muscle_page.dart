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
        title: Text(muscle.toUpperCase(),style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),),
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
                    fontSize: 16,
                    color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  subtitle: Text("Equipment: ${exercise.equipment}",style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),iconColor: const Color.fromARGB(255, 0, 0, 0),
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