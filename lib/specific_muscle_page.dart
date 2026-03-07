import 'package:flutter/material.dart';
import 'muscle_page.dart';

class SpecificMusclePage extends StatelessWidget {

  final String muscle;

  const SpecificMusclePage({super.key, required this.muscle});

  @override
  Widget build(BuildContext context) {

    List<String> subMuscles = [];

    if (muscle == "Chest") {
      subMuscles = ["chest"];
    }
    else if (muscle == "Back") {
      subMuscles = ["lats"];
    }
    else if (muscle == "Biceps") {
      subMuscles = ["biceps"];
    }
    else if (muscle == "Triceps") {
      subMuscles = ["triceps"];
    }
    else if (muscle == "Legs") {
      subMuscles = ["quadriceps", "hamstrings", "calves"];
    }
    else if (muscle == "Shoulders") {
      subMuscles = ["delts"];
    }
    else if (muscle == "Abs") {
      subMuscles = ["abs"];
    }

    return Scaffold(

      appBar: AppBar(title: Text(muscle,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 255, 255, 255),
      ),),),
      

      body: Column(
        children: [
          SizedBox(height: 20,),
          SizedBox(
            height: 500,
            child: ListView.builder(
            
              itemCount: subMuscles.length,
            
              itemBuilder: (context, index) {
            
                return ListTile(
            
                  title: Text("${index + 1}. ${subMuscles[index]}",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    ),
            
                  trailing: const Icon(Icons.arrow_forward),
                  iconColor: Colors.black,
            
                  onTap: () {
            
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            MusclePage(muscle: subMuscles[index]),
                      ),
                    );
            
                  },
                );
            
              },
            ),
          ),
        ],
      ),
    );
  }
}