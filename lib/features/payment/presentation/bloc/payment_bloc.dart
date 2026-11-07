import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym/features/payment/domain/entities/payment.dart';
import 'package:gym/features/payment/domain/usecase/save_payment.dart';

import 'payment_event.dart';
import 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final SavePayment savePayment;


  PaymentBloc({
    required this.savePayment,
  }) : super(PaymentInitial()) {


    on<PaymentSucceeded>(
      _onPaymentSuccess,
    );

    on<PaymentFailed>(
      _onFailed,
    ); 
    on<PaymentStarted>(_onStarted);
    on<PaymentSucceeded>(_onPaymentSuccess);
    on<PaymentFailed>(_onFailed);
  }

  void _onStarted(
    PaymentStarted event,
    Emitter<PaymentState> emit,
  ) {
    emit(PaymentLoading());
  }

  Future<void> _onPaymentSuccess(
  PaymentSucceeded event,
  Emitter<PaymentState> emit,
  ) async {

    emit(PaymentLoading());


    try {

      final payment = Payment(
        id: "",
        userId: event.userId,
        planId: event.planId,
        planName: event.planName,
        amount: event.amount,
        status: "Success",
        paymentId: event.paymentId,
        createdAt: DateTime.now(),
      );


      await savePayment(
        payment: payment,
        duration: 90,
      );


      emit(
        PaymentSuccess(),
      );


    } catch(e){

      emit(
        PaymentFailure(
          e.toString(),
        ),
      );

    }
  }

  void _onFailed(
    PaymentFailed event,
    Emitter<PaymentState> emit,
  ) {
    emit(PaymentFailure(event.message));
  }
}