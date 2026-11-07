import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym/features/membership/data/model/membership_plan_model.dart';

//import '../models/membership_plan_model.dart';
import 'membership_remote_data_source.dart';

class MembershipRemoteDataSourceImpl
    implements MembershipRemoteDataSource {
  final FirebaseFirestore firestore;

  MembershipRemoteDataSourceImpl({
    required this.firestore,
  });

  @override
  Future<List<MembershipPlanModel>> getMembershipPlans() async {
    final snapshot = await firestore
        .collection('membership_plans')
        .get();

    return snapshot.docs
        .map(
          (doc) => MembershipPlanModel.fromMap(
            doc.data(),
            doc.id,
          ),
        )
        .toList();
  }
}