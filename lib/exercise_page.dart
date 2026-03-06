import 'package:flutter/material.dart';
import 'models/exercise_model.dart';

class ExercisePage extends StatelessWidget {

  final Exercise exercise;

  const ExercisePage({
    super.key,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(exercise.name),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    // ClipRRect(
    //   borderRadius: BorderRadius.circular(20),
    //   child: Image.network(exercise.gifUrl),
    // ),

    const SizedBox(height: 20),

    Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Body Part: ${exercise.bodyPart}"),
            const SizedBox(height: 6),
            Text("Target: ${exercise.target}"),
            const SizedBox(height: 6),
            Text("Equipment: ${exercise.equipment}"),
          ],
        ),
      ),
    ),

    const SizedBox(height: 20),

    const Text(
      "Instructions",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),

    const SizedBox(height: 10),

    exercise.instructions.isEmpty
        ? const Text("No instructions available")
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: exercise.instructions.map((step) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text("• $step"),
              );
            }).toList(),
          ),
  ],
),
      ),
    );
  }
}