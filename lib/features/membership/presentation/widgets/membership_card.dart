import 'package:flutter/material.dart';
import 'package:gym/features/membership/presentation/pages/membership_details_page.dart';

import '../../domain/entities/membership_plan.dart';

class MembershipCard extends StatelessWidget {
  final MembershipPlan plan;

  const MembershipCard({
    super.key,
    required this.plan,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              plan.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "₹${plan.price}",
              style: const TextStyle(
                fontSize: 28,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text("${plan.duration} Days"),

            const SizedBox(height: 15),

            const Divider(),

            ...plan.features.map(
              (feature) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
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

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MembershipDetailsPage(
                        plan: plan,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Choose Plan",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}