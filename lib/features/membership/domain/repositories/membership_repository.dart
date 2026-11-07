import '../entities/membership_plan.dart';

abstract class MembershipRepository {
  Future<List<MembershipPlan>> getMembershipPlans();
}