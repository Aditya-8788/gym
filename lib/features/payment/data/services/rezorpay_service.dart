import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayService {
  late Razorpay _razorpay;

  Razorpay get razorpay => _razorpay;

  void initialize({
    required Function(PaymentSuccessResponse) onSuccess,
    required Function(PaymentFailureResponse) onFailure,
    required Function(ExternalWalletResponse) onExternalWallet,
  }) {
    _razorpay = Razorpay();

    _razorpay.on(
      Razorpay.EVENT_PAYMENT_SUCCESS,
      onSuccess,
    );

    _razorpay.on(
      Razorpay.EVENT_PAYMENT_ERROR,
      onFailure,
    );

    _razorpay.on(
      Razorpay.EVENT_EXTERNAL_WALLET,
      onExternalWallet,
    );
  }

  void openCheckout({
    required String key,
    required int amount,
    required String name,
    required String description,
    required String email,
    required String contact,
  }) {
    final options = {
      'key': key,
      'amount': amount,
      'name': name,
      'description': description,
      'prefill': {
        'contact': contact,
        'email': email,
      },
    };

    _razorpay.open(options);
  }

  void dispose() {
    _razorpay.clear();
  }
}