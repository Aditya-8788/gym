import '../entities/payment.dart';

abstract class PaymentRepository {
  Future<void> savePayment({
    required Payment payment,
    required int duration,
  });
}