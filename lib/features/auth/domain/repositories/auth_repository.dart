import '../entities/app_user.dart';

abstract class AuthRepository {
  AppUser? get currentUser;

  Future<AppUser> login(String email, String password);

  Future<AppUser> signup(String name, String email, String password);

  Future<AppUser> signInWithGoogle();

  Future<void> logout();
}