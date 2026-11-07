import 'package:gym/features/membership/data/model/membership_plan_model.dart';

//import '../models/membership_plan_model.dart';

abstract class MembershipRemoteDataSource {
  Future<List<MembershipPlanModel>> getMembershipPlans();
}