import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gym/starting_page.dart';
import 'firebase_options.dart';
import 'loginpage.dart';
import 'blocs/auth/auth_bloc.dart';
import 'blocs/exercise/exercise_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<ExerciseBloc>(create: (context) => ExerciseBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.deepOrangeAccent,
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.orange,
            centerTitle: true,
            elevation: 0,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent,
              disabledForegroundColor: Colors.deepOrangeAccent,
              disabledBackgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
          cardTheme: CardThemeData(
            color: const Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 6,
          ),
        ),
        home: const StartingPage(),
      ),
    );
  }
}
