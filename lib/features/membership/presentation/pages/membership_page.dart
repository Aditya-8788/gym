import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/membership_bloc.dart';
import '../bloc/membership_event.dart';
import '../bloc/membership_state.dart';
import '../widgets/membership_card.dart';

class MembershipPage extends StatefulWidget {
  const MembershipPage({super.key});

  @override
  State<MembershipPage> createState() => _MembershipPageState();
}

class _MembershipPageState extends State<MembershipPage> {
  @override
  void initState() {
    super.initState();

    context.read<MembershipBloc>().add(
      LoadMembershipPlans(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Membership Plans"),
      ),
      body: BlocBuilder<MembershipBloc, MembershipState>(
        builder: (context, state) {

          if (state is MembershipLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is MembershipError) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is MembershipLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.plans.length,
              itemBuilder: (context, index) {
                return MembershipCard(
                  plan: state.plans[index],
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}