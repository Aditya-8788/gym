import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym/features/payment/data/model/payment_model.dart';

//import '../models/payment_model.dart';
import 'payment_remote_data_source.dart';

class PaymentRemoteDataSourceImpl
    implements PaymentRemoteDataSource {

  final FirebaseFirestore firestore;

  PaymentRemoteDataSourceImpl({
    required this.firestore,
  });

  @override
  Future<void> savePayment({
    required PaymentModel payment,
    required int duration,
  }) async {

    final batch = firestore.batch();

    final paymentRef =
        firestore.collection('payments').doc();

    batch.set(
      paymentRef,
      payment.toMap(),
    );

    final membershipRef = firestore
        .collection('memberships')
        .doc(payment.userId);

    final startDate = DateTime.now();

    final expiryDate =
        startDate.add(Duration(days: duration));

    batch.set(
      membershipRef,
      {
        "planId": payment.planId,
        "planName": payment.planName,
        "amount": payment.amount,
        "status": "Active",
        "startDate": Timestamp.fromDate(startDate),
        "expiryDate": Timestamp.fromDate(expiryDate),
      },
    );

    await batch.commit();
  }
}