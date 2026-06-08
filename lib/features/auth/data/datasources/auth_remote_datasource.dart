import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRemoteDataSource {
  Future<User> login(String email, String password);
  Future<User> signup(String name, String email, String password);
  Future<User> signInWithGoogle();
  Future<void> logout();
  User? get currentUser;
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthRemoteDataSourceImpl({
    FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        googleSignIn = googleSignIn ?? GoogleSignIn.instance;

  @override
  User? get currentUser {
    return firebaseAuth.currentUser;
  }

  @override
  Future<User> login(String email, String password) async {
    final result = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return result.user!;
  }

  @override
  Future<User> signup(String name, String email, String password) async {
    final result = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await result.user!.updateDisplayName(name);
    await result.user!.reload();

    return firebaseAuth.currentUser!;
  }

  @override
  Future<User> signInWithGoogle() async {
    await googleSignIn.initialize();

    final googleUser = await googleSignIn.authenticate();

    final googleAuth = googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    final userCredential = await firebaseAuth.signInWithCredential(
      credential,
    );

    return userCredential.user!;
  }

  @override
  Future<void> logout() async {
    await googleSignIn.signOut();
    await firebaseAuth.signOut();
  }
}