// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:firebase_core/firebase_core.dart';

// import 'firebase_options.dart';

// import 'features/auth/presentation/pages/starting_page.dart';

// import 'features/auth/data/datasources/auth_remote_datasource.dart';
// import 'features/auth/data/repositories/auth_repository_impl.dart';
// import 'features/auth/domain/usecases/login_user.dart';
// import 'features/auth/domain/usecases/signup_user.dart';
// import 'features/auth/domain/usecases/logout_user.dart';
// import 'features/auth/domain/usecases/sign_in_with_google.dart';
// import 'features/auth/presentation/bloc/auth_bloc.dart';

// import 'features/exercise/presentation/bloc/exercise_bloc.dart';
// import 'features/exercise/data/datasources/exercise_remote_datasource.dart';
// import 'features/profile/data/datasources/profile_remote_datasource.dart';
// import 'features/profile/data/repositories/profile_repository_impl.dart';
// import 'features/profile/domain/usecases/save_user_profile.dart';
// import 'features/profile/presentation/bloc/profile_bloc.dart';


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final authRepository = AuthRepositoryImpl(
//       AuthRemoteDataSourceImpl(),
//     );

//     final profileRepository = ProfileRepositoryImpl(
//       ProfileRemoteDataSourceImpl(),
//     );

//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<AuthBloc>(
//           create: (_) => AuthBloc(
//             loginUser: LoginUser(authRepository),
//             signupUser: SignupUser(authRepository),
//             logoutUser: LogoutUser(authRepository),
//             signInWithGoogle: SignInWithGoogle(authRepository),
//           ),
//         ),

//         BlocProvider<ExerciseBloc>(
//           create: (_) => ExerciseBloc(
//            remoteDataSource: ExerciseRemoteDataSource(),
//           ),
//         ),

//         BlocProvider<ProfileBloc>(
//           create: (_) => ProfileBloc(
//             saveUserProfile: SaveUserProfile(profileRepository),
//           ),
//         ),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           brightness: Brightness.dark,
//           primaryColor: Colors.deepOrangeAccent,
//           scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
//           appBarTheme: const AppBarTheme(
//             backgroundColor: Colors.orange,
//             centerTitle: true,
//             elevation: 0,
//           ),
//           elevatedButtonTheme: ElevatedButtonThemeData(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.deepOrangeAccent,
//               disabledForegroundColor: Colors.deepOrangeAccent,
//               disabledBackgroundColor: Colors.grey,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               padding: const EdgeInsets.symmetric(vertical: 14),
//             ),
//           ),
//           cardTheme: CardThemeData(
//             color: const Color.fromARGB(255, 255, 255, 255),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//             elevation: 6,
//           ),
//         ),
//         home: const StartingPage(),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';

import 'features/auth/presentation/pages/starting_page.dart';

import 'features/auth/data/datasources/auth_remote_datasource.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/login_user.dart';
import 'features/auth/domain/usecases/signup_user.dart';
import 'features/auth/domain/usecases/logout_user.dart';
import 'features/auth/domain/usecases/sign_in_with_google.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

import 'features/exercise/data/datasources/exercise_remote_datasource.dart';
import 'features/exercise/presentation/bloc/exercise_bloc.dart';

import 'features/profile/data/datasources/profile_remote_datasource.dart';
import 'features/profile/data/repositories/profile_repository_impl.dart';
import 'features/profile/domain/usecases/save_user_profile.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepository = AuthRepositoryImpl(
      AuthRemoteDataSourceImpl(),
    );

    final profileRepository = ProfileRepositoryImpl(
      ProfileRemoteDataSourceImpl(),
    );

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (_) => AuthBloc(
                loginUser: LoginUser(authRepository),
                signupUser: SignupUser(authRepository),
                logoutUser: LogoutUser(authRepository),
                signInWithGoogle: SignInWithGoogle(authRepository),
              ),
            ),
            BlocProvider<ExerciseBloc>(
              create: (_) => ExerciseBloc(
                remoteDataSource: ExerciseRemoteDataSource(),
              ),
            ),
            BlocProvider<ProfileBloc>(
              create: (_) => ProfileBloc(
                saveUserProfile: SaveUserProfile(profileRepository),
              ),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: const Color(0xffFFF7F0),
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepOrange,
              ),
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
                centerTitle: true,
                elevation: 0,
              ),
            ),
            home: const StartingPage(),
          ),
        );
      },
    );
  }
}