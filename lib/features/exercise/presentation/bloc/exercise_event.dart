import 'package:equatable/equatable.dart';

abstract class ExerciseEvent extends Equatable {
  const ExerciseEvent();

  @override
  List<Object?> get props => [];
}

class FetchExercisesRequested extends ExerciseEvent {
  final String muscleName;

  const FetchExercisesRequested(this.muscleName);

  @override
  List<Object?> get props => [muscleName];
}