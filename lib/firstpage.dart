import 'package:flutter/material.dart';
import 'package:gym/specific_muscle_page.dart';
import 'muscle_page.dart';

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
      appBar: AppBar(title: const Text("Select Muscle")),
      body: ListView.builder(
        itemCount: muscles.length,
        itemBuilder: (context, index) {
           return ListTile(
            title: Text(muscles[index]),

            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      SpecificMusclePage(muscle: muscles[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}