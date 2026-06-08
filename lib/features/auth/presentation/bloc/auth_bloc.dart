// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gym/features/auth/presentation/bloc/auth_event.dart';
// import 'auth_event.dart';
// import 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   final FirebaseAuth _firebaseAuth;

//   AuthBloc({FirebaseAuth? firebaseAuth})
//       : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
//         super((firebaseAuth ?? FirebaseAuth.instance).currentUser != null
//             ? AuthAuthenticated((firebaseAuth ?? FirebaseAuth.instance).currentUser!)
//             : AuthInitial()) {
//     on<AuthLoginRequested>(_onAuthLoginRequested);
//     on<AuthSignupRequested>(_onAuthSignupRequested);
//     on<AuthLogoutRequested>(_onAuthLogoutRequested);
//     on<AuthGoogleLoginRequested>(_onAuthGoogleLoginRequested);
//   }

//   Future<void> _onAuthLoginRequested(
//     AuthLoginRequested event,
//     Emitter<AuthState> emit,
//   ) async {
//     emit(AuthLoading());
//     try {
//       UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
//         email: event.email,
//         password: event.password,
//       );
//       if (userCredential.user != null) {
//         emit(AuthAuthenticated(userCredential.user!));
//       } else {
//         emit(const AuthError('Login failed: User is null'));
//       }
//     } on FirebaseAuthException catch (e) {
//       emit(AuthError(e.message ?? 'An unknown error occurred'));
//     } catch (e) {
//       emit(AuthError(e.toString()));
//     }
//   }

//   Future<void> _onAuthSignupRequested(
//     AuthSignupRequested event,
//     Emitter<AuthState> emit,
//   ) async {
//     emit(AuthLoading());
//     try {
//       UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
//         email: event.email,
//         password: event.password,
//       );
//       if (userCredential.user != null) {
//         await userCredential.user!.updateDisplayName(event.name);
//         // Wait for displayName update to propagate
//         await userCredential.user!.reload();
//         final updatedUser = _firebaseAuth.currentUser;
//         if (updatedUser != null) {
//           emit(AuthAuthenticated(updatedUser)); // We directly authenticate them after signup
//         } else {
//           emit(const AuthError('User could not be loaded after signup'));
//         }
//       } else {
//         emit(const AuthError('Signup failed: User is null'));
//       }
//     } on FirebaseAuthException catch (e) {
//       emit(AuthError(e.message ?? 'An unknown error occurred'));
//     } catch (e) {
//       emit(AuthError(e.toString()));
//     }
//   }

//   Future<void> _onAuthLogoutRequested(
//     AuthLogoutRequested event,
//     Emitter<AuthState> emit,
//   ) async {
//     emit(AuthLoading());
//     try {
//       await _firebaseAuth.signOut();
//       emit(AuthUnauthenticated());
//     } catch (e) {
//       emit(AuthError(e.toString()));
//     }
//   }

//   Future<void> _onAuthGoogleLoginRequested(
//     AuthGoogleLoginRequested event,
//     Emitter<AuthState> emit,
//   ) async {
//     emit(AuthLoading());
//     try {
//       // Implementation for Google login
//     } catch (e) {
//       emit(AuthError(e.toString()));
//     }
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/signup_user.dart';
import '../../domain/usecases/logout_user.dart';
import '../../domain/usecases/sign_in_with_google.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser loginUser;
  final SignupUser signupUser;
  final LogoutUser logoutUser;
  final SignInWithGoogle signInWithGoogle;

  AuthBloc({
    required this.loginUser,
    required this.signupUser,
    required this.logoutUser,
    required this.signInWithGoogle,
  }) : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthSignupRequested>(_onAuthSignupRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
    on<AuthGoogleLoginRequested>(_onAuthGoogleLoginRequested);
  }

  Future<void> _onAuthLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final user = await loginUser(event.email, event.password);
      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onAuthSignupRequested(
    AuthSignupRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final user = await signupUser(
        event.name,
        event.email,
        event.password,
      );

      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      await logoutUser();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onAuthGoogleLoginRequested(
    AuthGoogleLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final user = await signInWithGoogle();
      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
