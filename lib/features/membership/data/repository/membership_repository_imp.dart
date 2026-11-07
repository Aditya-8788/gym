import '../../domain/entities/membership_plan.dart';
import '../../domain/repositories/membership_repository.dart';
import '../datasource/membership_remote_data_source.dart';

class MembershipRepositoryImpl implements MembershipRepository {
  final MembershipRemoteDataSource remoteDataSource;

  MembershipRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<MembershipPlan>> getMembershipPlans() async {
    return await remoteDataSource.getMembershipPlans();
  }
}