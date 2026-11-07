
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym/features/payment/data/services/rezorpay_service.dart';

import '../../domain/entities/membership_plan.dart';

//import '../../../payment/data/services/razorpay_service.dart';
import '../../../payment/presentation/bloc/payment_bloc.dart';
import '../../../payment/presentation/bloc/payment_event.dart';


class MembershipDetailsPage extends StatefulWidget {

  final MembershipPlan plan;

  const MembershipDetailsPage({
    super.key,
    required this.plan,
  });


  @override
  State<MembershipDetailsPage> createState() =>
      _MembershipDetailsPageState();
}



class _MembershipDetailsPageState 
    extends State<MembershipDetailsPage> {


  final RazorpayService razorpayService =
      RazorpayService();



  @override
  void initState() {
    super.initState();


    razorpayService.initialize(

      onSuccess: (response) {

        context.read<PaymentBloc>().add(
          PaymentSucceeded(
            paymentId: response.paymentId!,
            userId: "CURRENT_USER_ID",
            planId: widget.plan.id,
            planName: widget.plan.name,
            amount: widget.plan.price,
          ),
        );

      },


      onFailure: (response) {

        context.read<PaymentBloc>().add(
          PaymentFailed(
            response.message ??
            "Payment Failed",
          ),
        );

      },


      onExternalWallet: (response) {

        debugPrint(
          "Wallet: ${response.walletName}",
        );

      },

    );
  }



  void startPayment(){

    razorpayService.openCheckout(

      key: "rzp_test_YOUR_KEY",

      amount: widget.plan.price * 100,

      name: "Aditya Fitness",

      description:
          "${widget.plan.name} Membership",

      email: "user@gmail.com",

      contact: "9999999999",

    );

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(widget.plan.name),
      ),


      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,


          children: [


            Text(
              widget.plan.name,

              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),



            const SizedBox(height: 10),



            Text(

              "₹${widget.plan.price}",

              style: const TextStyle(
                fontSize: 34,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              ),

            ),



            const SizedBox(height: 8),



            Text(
              "${widget.plan.duration} Days",

              style: const TextStyle(
                fontSize: 18,
              ),

            ),



            const SizedBox(height: 25),



            const Text(

              "Description",

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),

            ),



            const SizedBox(height: 8),



            Text(
              widget.plan.description,
            ),



            const SizedBox(height: 30),



            const Text(

              "Features",

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),

            ),



            const SizedBox(height: 15),



            ...widget.plan.features.map(

              (feature) => Padding(

                padding:
                    const EdgeInsets.only(bottom: 12),


                child: Row(

                  children: [

                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),


                    const SizedBox(width: 10),


                    Expanded(
                      child: Text(feature),
                    ),

                  ],

                ),

              ),

            ),



            const SizedBox(height: 40),



            SizedBox(

              width: double.infinity,

              height: 55,


              child: ElevatedButton(

                onPressed: () {
                  debugPrint("Selected Plan: ${widget.plan.name}");
                  debugPrint("Amount: ${widget.plan.price}");
                },


                child: const Text(
                  "Continue to Payment",
                ),

              ),

            ),

          ],

        ),

      ),

    );

  }



  @override
  void dispose() {

    razorpayService.dispose();

    super.dispose();

  }

}