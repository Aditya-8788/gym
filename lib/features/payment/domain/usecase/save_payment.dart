import '../entities/payment.dart';
import '../repositories/payment_repository.dart';

class SavePayment {

  final PaymentRepository repository;

  SavePayment({
    required this.repository,
  });


  Future<void> call({
    required Payment payment,
    required int duration,
  }) async {

    await repository.savePayment(
      payment: payment,
      duration: duration,
    );
  }
}