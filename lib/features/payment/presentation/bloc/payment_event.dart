import 'package:equatable/equatable.dart';

class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object?> get props => [];
}

class PaymentStarted extends PaymentEvent {}

class PaymentSucceeded extends PaymentEvent {
  final String paymentId;
  final String userId;
  final String planId;
  final String planName;
  final int amount;

  const PaymentSucceeded({
    required this.paymentId,
    required this.userId,
    required this.planId,
    required this.planName,
    required this.amount,
  });

  @override
  List<Object?> get props => [
        paymentId,
        userId,
        planId,
        planName,
        amount,
      ];
}

class PaymentFailed extends PaymentEvent {
  final String message;

  const PaymentFailed(this.message);

  @override
  List<Object?> get props => [message];
}