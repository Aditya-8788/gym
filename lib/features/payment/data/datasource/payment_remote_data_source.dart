import 'package:gym/features/payment/data/model/payment_model.dart';

//import '../models/payment_model.dart';

abstract class PaymentRemoteDataSource {
  Future<void> savePayment({
    required PaymentModel payment,
    required int duration,
  });
}