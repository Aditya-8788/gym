import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/exercise/exercise_bloc.dart';
import 'blocs/exercise/exercise_event.dart';
import 'blocs/exercise/exercise_state.dart';
import 'exercise_page.dart';

class MusclePage extends StatefulWidget {
  final String muscle;

  const MusclePage({super.key, required this.muscle});

  @override
  State<MusclePage> createState() => _MusclePageState();
}

class _MusclePageState extends State<MusclePage> {
  @override
  void initState() {
    super.initState();
    context.read<ExerciseBloc>().add(FetchExercisesRequested(widget.muscle));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.muscle.toUpperCase(),
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      body: BlocBuilder<ExerciseBloc, ExerciseState>(
        builder: (context, state) {
          if (state is ExerciseLoading || state is ExerciseInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ExerciseError) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is ExerciseLoaded) {
            if (state.exercises.isEmpty) {
              return const Center(child: Text("No exercises found"));
            }

            return ListView.builder(
              itemCount: state.exercises.length,
              itemBuilder: (context, index) {
                final exercise = state.exercises[index];

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
                    subtitle: Text(
                      "Equipment: ${exercise.equipment}",
                      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    iconColor: const Color.fromARGB(255, 0, 0, 0),
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
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}