import 'package:equatable/equatable.dart';

import '../../domain/entities/membership_plan.dart';

abstract class MembershipState extends Equatable {
  const MembershipState();

  @override
  List<Object?> get props => [];
}

class MembershipInitial extends MembershipState {}

class MembershipLoading extends MembershipState {}

class MembershipLoaded extends MembershipState {
  final List<MembershipPlan> plans;

  const MembershipLoaded(this.plans);

  @override
  List<Object?> get props => [plans];
}

class MembershipError extends MembershipState {
  final String message;

  const MembershipError(this.message);

  @override
  List<Object?> get props => [message];
}