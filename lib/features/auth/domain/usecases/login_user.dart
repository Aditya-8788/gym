import '../entities/app_user.dart';
import '../repositories/auth_repository.dart';

class LoginUser {
  const LoginUser(this.repository);

  final AuthRepository repository;

  Future<AppUser> call(String email, String password) {
    return repository.login(email, password);
  }
}
