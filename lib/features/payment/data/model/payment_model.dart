import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/payment.dart';

class PaymentModel extends Payment {
  const PaymentModel({
    required super.id,
    required super.userId,
    required super.planId,
    required super.planName,
    required super.amount,
    required super.status,
    required super.paymentId,
    required super.createdAt,
  });

  factory PaymentModel.fromMap(
    Map<String, dynamic> map,
    String documentId,
  ) {
    return PaymentModel(
      id: documentId,
      userId: map['userId'] ?? '',
      planId: map['planId'] ?? '',
      planName: map['planName'] ?? '',
      amount: map['amount'] ?? 0,
      status: map['status'] ?? '',
      paymentId: map['paymentId'] ?? '',
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'planId': planId,
      'planName': planName,
      'amount': amount,
      'status': status,
      'paymentId': paymentId,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}