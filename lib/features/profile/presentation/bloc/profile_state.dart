import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSaved extends ProfileState {
  final double bmi;
  final String bmiCategory;

  const ProfileSaved({
    required this.bmi,
    required this.bmiCategory,
  });

  @override
  List<Object?> get props => [bmi, bmiCategory];
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}