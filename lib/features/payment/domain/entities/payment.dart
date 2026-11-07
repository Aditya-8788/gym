import 'package:equatable/equatable.dart';

class Payment extends Equatable {
  final String id;
  final String userId;
  final String planId;
  final String planName;
  final int amount;
  final String status;
  final String paymentId;
  final DateTime createdAt;

  const Payment({
    required this.id,
    required this.userId,
    required this.planId,
    required this.planName,
    required this.amount,
    required this.status,
    required this.paymentId,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        planId,
        planName,
        amount,
        status,
        paymentId,
        createdAt,
      ];
}