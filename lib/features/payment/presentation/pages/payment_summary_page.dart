import 'package:flutter/material.dart';

import '../../../membership/domain/entities/membership_plan.dart';

class PaymentSummaryPage extends StatefulWidget {
  final MembershipPlan plan;

  const PaymentSummaryPage({
    super.key,
    required this.plan,
  });

  @override
  State<PaymentSummaryPage> createState() => _PaymentSummaryPageState();
}

class _PaymentSummaryPageState extends State<PaymentSummaryPage> {
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    final plan = widget.plan;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Summary"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Icon(
                      Icons.workspace_premium,
                      size: 60,
                      color: Colors.orange,
                    ),

                    const SizedBox(height: 15),

                    Text(
                      plan.name,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "₹${plan.price}",
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "${plan.duration} Days",
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Included Features",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: plan.features.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    title: Text(
                      plan.features[index],
                    ),
                  );
                },
              ),
            ),

            TextField(
              decoration: InputDecoration(
                hintText: "Enter Coupon Code",
                prefixIcon: const Icon(Icons.discount),
                suffixIcon: TextButton(
                  onPressed: () {
                    // Apply coupon later
                  },
                  child: const Text("Apply"),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Column(
              children: [
                _priceRow(
                  "Membership Fee",
                  "₹${plan.price}",
                ),

                _priceRow(
                  "Discount",
                  "-₹0",
                ),

                _priceRow(
                  "GST",
                  "₹0",
                ),

                const Divider(),

                _priceRow(
                  "Total",
                  "₹${plan.price}",
                  isBold: true,
                ),
              ],
            ),

            const SizedBox(height: 12),

            CheckboxListTile(
              value: agree,
              onChanged: (value) {
                setState(() {
                  agree = value ?? false;
                });
              },
              title: const Text(
                "I agree to Terms & Conditions",
              ),
            ),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "₹${plan.price}",
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [

                Icon(
                  Icons.lock,
                  color: Colors.green,
                  size: 18,
                ),

                SizedBox(width: 8),

                Text(
                  "100% Secure Payment",
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: agree
                    ? () {
                        // Razorpay here later
                      }
                    : null,
                child: const Text(
                  "Confirm Payment",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _priceRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: isBold ? 18 : 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: isBold ? 18 : 16,
            ),
          ),
        ],
      ),
    );
  }
}
