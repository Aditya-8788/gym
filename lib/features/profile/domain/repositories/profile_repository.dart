import '../entities/user_profile.dart';

abstract class ProfileRepository {
  Future<void> saveUserProfile(UserProfile profile);
}