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
        title: Text(exercise.name, style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255,),
        fontWeight: FontWeight.bold,
        fontSize: 25),),
      ),

      body: SingleChildScrollView(

        //padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,
            width: double.infinity,),

            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Body Part: ${exercise.bodyPart}", style: const TextStyle(fontSize: 20,color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.w500),),
                    const SizedBox(height: 6),
                    Text("Target: ${exercise.target}", style: const TextStyle(fontSize: 20,color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.w500),),
                    const SizedBox(height: 6),
                    Text("Equipment: ${exercise.equipment}", style: const TextStyle(fontSize: 20,color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: const Text(
                "Instructions",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),

            const SizedBox(height: 10),

            exercise.instructions.isEmpty? const Text("No instructions available", style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),)
            : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: exercise.instructions.map(
                (step) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8, left: 16.0, right: 10.0),
                    child: Text("• $step", style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),),
                  );
                }
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}