import '../entities/membership_plan.dart';
import '../repositories/membership_repository.dart';

class GetMembershipPlans {
  final MembershipRepository repository;

  GetMembershipPlans({
    required this.repository,
  });

  Future<List<MembershipPlan>> call() async {
    return await repository.getMembershipPlans();
  }
}
