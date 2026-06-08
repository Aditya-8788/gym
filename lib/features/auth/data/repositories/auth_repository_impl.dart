import '../../domain/entities/app_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/app_user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  @override
AppUser? get currentUser {
  final user = remoteDataSource.currentUser;

  if (user == null) return null;

  return AppUserModel.fromFirebaseUser(user);
}

  @override
  Future<AppUser> login(String email, String password) async {
    final user = await remoteDataSource.login(email, password);
    return AppUserModel.fromFirebaseUser(user);
  }

  @override
  Future<AppUser> signup(String name, String email, String password) async {
    final user = await remoteDataSource.signup(name, email, password);
    return AppUserModel.fromFirebaseUser(user);
  }

  @override
  Future<AppUser> signInWithGoogle() async {
    final user = await remoteDataSource.signInWithGoogle();
    return AppUserModel.fromFirebaseUser(user);
  }

  @override
  Future<void> logout() async {
    await remoteDataSource.logout();
  }
}