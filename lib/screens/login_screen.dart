import 'package:flutter/material.dart';
import 'package:zoom_clone/services/auth_methods.dart';
import 'package:zoom_clone/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.lock,
            size: 90,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          // Text(
          //   'Welcome Back',
          //   style: TextStyle(
          //     fontSize: 16,
          //     fontWeight: FontWeight.bold,
          //     color: Theme.of(context).colorScheme.tertiary,
          //   ),
          // ),
          Image.asset('assets/onboarding-removebg-preview.png',),
          CustomButton(
            buttonName: 'Sign in',
            onPressed: () async {
              bool res = await _authMethods.signInWithGoogle(context);
              if (res == true) {
                Navigator.pushNamed(context, '/home');
              }
            },
          )
        ],
      ),
    );
  }
}
