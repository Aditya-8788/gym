import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class SaveProfileRequested extends ProfileEvent {
  final double weight;
  final double height;

  const SaveProfileRequested({
    required this.weight,
    required this.height,
  });

  @override
  List<Object?> get props => [weight, height];
}