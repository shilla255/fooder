import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../theme/app_color.dart';
import 'custom_animated_textfield.dart';
import 'custom_animated_button.dart';

class SignInForm extends ConsumerWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomAnimatedTextField(
                controller: emailController,
                labelText: 'Email',
              ),
              const SizedBox(height: 16.0),
              CustomAnimatedTextField(
                controller: passwordController,
                labelText: 'Password',
              ),
              const SizedBox(height: 32.0),
              CustomAnimatedTextButton(
                text: 'Sign In',
                onPressed: () {
                  // Handle sign-in logic
                },
              ),
              const SizedBox(height: 16.0),
              CustomAnimatedTextButton(
                text: 'Sign in with Google',
                onPressed: () {
                  // Handle Google sign-in logic
                },
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  // Handle forgot password logic
                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}