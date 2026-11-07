import 'package:gym/features/payment/data/model/payment_model.dart';

import '../../domain/entities/payment.dart';
import '../../domain/repositories/payment_repository.dart';
import '../datasource/payment_remote_data_source.dart';
//import '../models/payment_model.dart';

class PaymentRepositoryImpl
    implements PaymentRepository {

  final PaymentRemoteDataSource remoteDataSource;

  PaymentRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<void> savePayment({
    required Payment payment,
    required int duration,
  }) async {

    final model = PaymentModel(
      id: payment.id,
      userId: payment.userId,
      planId: payment.planId,
      planName: payment.planName,
      amount: payment.amount,
      status: payment.status,
      paymentId: payment.paymentId,
      createdAt: payment.createdAt,
    );

    await remoteDataSource.savePayment(
      payment: model,
      duration: duration,
    );
  }
}