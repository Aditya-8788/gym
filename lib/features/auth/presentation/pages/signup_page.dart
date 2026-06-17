// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gym/features/auth/presentation/bloc/auth_bloc.dart';
// import 'package:gym/features/auth/presentation/bloc/auth_event.dart';
// import 'package:gym/features/auth/presentation/bloc/auth_state.dart';
// import 'package:gym/features/auth/presentation/pages/login_page.dart';

// class SignupPage extends StatefulWidget {
//   const SignupPage({super.key});

//   @override
//   State<SignupPage> createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   void _signup() {
//     if (_nameController.text.isEmpty ||
//         _emailController.text.isEmpty ||
//         _passwordController.text.isEmpty) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
//       return;
//     }

//     context.read<AuthBloc>().add(
//       AuthSignupRequested(
//         _nameController.text.trim(),
//         _emailController.text.trim(),
//         _passwordController.text.trim(),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<AuthBloc, AuthState>(
//       listener: (context, state) {
//         if (state is AuthAuthenticated) {
//           // You could also route to Loginpage if you prefer they login again, but our BLoC authenticates them directly.
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => const Loginpage()),
//           );
//         } else if (state is AuthError) {
//           ScaffoldMessenger.of(
//             context,
//           ).showSnackBar(SnackBar(content: Text(state.message)));
//         }
//       },
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(height: 80),
//               Card(
//                 elevation: 10,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: const Text(
//                     'Signup Page',
//                     style: TextStyle(
//                       fontSize: 50,
//                       fontWeight: FontWeight.w800,
//                       color: Color.fromARGB(255, 0, 0, 0),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 40),
//               const Text(
//                 'Enter your name ',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                   color: Color.fromARGB(255, 120, 120, 120),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 height: 100,
//                 width: 300,
//                 child: TextField(
//                   controller: _nameController,
//                   decoration: InputDecoration(
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(
//                         color: Colors.orange,
//                         width: 2.0,
//                       ),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         color: Color.fromARGB(255, 4, 4, 4),
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     labelText: 'Name',
//                     prefixIcon: const Icon(Icons.person, color: Colors.orange),
//                   ),
//                 ),
//               ),
//               const Text(
//                 'Enter your email ',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                   color: Color.fromARGB(255, 120, 120, 120),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 height: 100,
//                 width: 300,
//                 child: TextField(
//                   controller: _emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(
//                         color: Colors.orange,
//                         width: 2.0,
//                       ),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         color: Color.fromARGB(255, 4, 4, 4),
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     labelText: 'Email',
//                     prefixIcon: const Icon(Icons.email, color: Colors.orange),
//                   ),
//                 ),
//               ),
//               const Text(
//                 'Enter your password',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                   color: Color.fromARGB(255, 120, 120, 120),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 height: 80,
//                 width: 300,
//                 child: TextField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(
//                         color: Color.fromARGB(255, 0, 255, 26),
//                         width: 2.0,
//                       ),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         color: Color.fromARGB(255, 0, 0, 0),
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     labelText: 'Password',
//                     prefixIcon: const Icon(
//                       Icons.lock,
//                       color: Color.fromARGB(255, 0, 255, 26),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               BlocBuilder<AuthBloc, AuthState>(
//                 builder: (context, state) {
//                   return state is AuthLoading
//                       ? const CircularProgressIndicator(color: Colors.orange)
//                       : const SizedBox.shrink();
//                 },
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   SizedBox(
//                     height: 60,
//                     width: 140,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.deepOrangeAccent,
//                         minimumSize: const Size(40, 50),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                       ),
//                       child: const Text(
//                         "previous ",
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 255, 255, 255),
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 60,
//                     width: 140,
//                     child: BlocBuilder<AuthBloc, AuthState>(
//                       builder: (context, state) {
//                         return ElevatedButton(
//                           onPressed: state is AuthLoading ? null : _signup,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.deepOrangeAccent,
//                             minimumSize: const Size(40, 50),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                           ),
//                           child: const Text(
//                             "signup",
//                             style: TextStyle(color: Colors.white, fontSize: 20),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 40),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gym/core/widgets/app_text_field.dart';
import 'package:gym/core/widgets/fade_slide_animation.dart';
import 'package:gym/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:gym/features/auth/presentation/bloc/auth_event.dart';
import 'package:gym/features/auth/presentation/bloc/auth_state.dart';
import 'package:gym/features/auth/presentation/pages/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signup() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    context.read<AuthBloc>().add(
          AuthSignupRequested(
            nameController.text.trim(),
            emailController.text.trim(),
            passwordController.text.trim(),
          ),
        );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const Loginpage()),
          );
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.w),
              child: FadeSlideAnimation(
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.orange.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 85.h,
                          width: 85.w,
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person_add,
                            size: 42.sp,
                            color: Colors.deepOrange,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Start your fitness journey today",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        AppTextField(
                          controller: nameController,
                          label: "Name",
                          icon: Icons.person,
                        ),
                        SizedBox(height: 18.h),
                        AppTextField(
                          controller: emailController,
                          label: "Email",
                          icon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 18.h),
                        AppTextField(
                          controller: passwordController,
                          label: "Password",
                          icon: Icons.lock,
                          obscureText: true,
                        ),
                        SizedBox(height: 24.h),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return SizedBox(
                              height: 55.h,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed:
                                    state is AuthLoading ? null : signup,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepOrange,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.r),
                                  ),
                                ),
                                child: state is AuthLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 22.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14.sp,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const Loginpage(),
                                  ),
                                );
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}