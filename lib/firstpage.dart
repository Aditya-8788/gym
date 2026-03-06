import 'package:flutter/material.dart';
import 'specific_muscle_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  final List<String> muscles = const [
    "Chest",
    "Back",
    "Biceps",
    "Triceps",
    "Legs",
    "Shoulders",
    "Abs"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Muscle"),titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: GridView.builder(
          itemCount: muscles.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SpecificMusclePage(muscle: muscles[index]),
                    // builder: (_) =>
                    //     SpecificMusclePage(muscle: muscles[index]),
                  ),
                );
              },
              child: Card(
                child: Center(
                  child: Text(
                    muscles[index],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}