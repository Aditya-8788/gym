import '../entities/user_profile.dart';
import '../repositories/profile_repository.dart';

class SaveUserProfile {
  final ProfileRepository repository;

  SaveUserProfile(this.repository);

  Future<void> call(UserProfile profile) {
    return repository.saveUserProfile(profile);
  }
}