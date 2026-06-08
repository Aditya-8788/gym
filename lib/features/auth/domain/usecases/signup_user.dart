import '../entities/app_user.dart';
import '../repositories/auth_repository.dart';

class SignupUser {
  const SignupUser(this.repository);

  final AuthRepository repository;

  Future<AppUser> call(String name, String email, String password) {
    return repository.signup(name, email, password);
  }
}
