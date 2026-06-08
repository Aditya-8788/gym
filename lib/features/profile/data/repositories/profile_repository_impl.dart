import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';
import '../models/user_profile_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> saveUserProfile(UserProfile profile) async {
    final model = UserProfileModel(
      uid: profile.uid,
      email: profile.email,
      weight: profile.weight,
      height: profile.height,
      bmi: profile.bmi,
      bmiCategory: profile.bmiCategory,
    );

    await remoteDataSource.saveUserProfile(model);
  }
}