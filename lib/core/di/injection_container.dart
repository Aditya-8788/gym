import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:gym/features/membership/data/datasource/membership_remote_data_source_impl.dart';
import 'package:gym/features/membership/data/repository/membership_repository_imp.dart';
import 'package:gym/features/membership/domain/repositories/membership_repository.dart';
import 'package:gym/features/membership/domain/usecase/get_membership_plans.dart';
import 'package:gym/features/membership/presentation/bloc/membership_bloc.dart';
import 'package:gym/features/membership/data/datasource/membership_remote_data_source.dart';

final sl = GetIt.instance;

void init() {
  // Firestore
  sl.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  // Data Source
  sl.registerLazySingleton<MembershipRemoteDataSource>(
    () => MembershipRemoteDataSourceImpl(
      firestore: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<MembershipRepository>(
    () => MembershipRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  // Use Case
  sl.registerLazySingleton<GetMembershipPlans>(
    () => GetMembershipPlans(
      repository: sl(),
    ),
  );

  // Bloc
  sl.registerFactory<MembershipBloc>(
    () => MembershipBloc(
      getMembershipPlans: sl(),
    ),
  );
}
