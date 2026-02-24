import 'package:flutter/material.dart';
import 'muscle_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  final List<String> muscles = const [
    "chest",
    "back",
    "biceps",
    "triceps",
    "shoulders",
    "quads",
    "hamstrings"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Muscle")),
      body: ListView.builder(
        itemCount: muscles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(muscles[index].toUpperCase()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MusclePage(muscle: muscles[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}