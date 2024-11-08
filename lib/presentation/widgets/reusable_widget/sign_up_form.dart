import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../theme/app_color.dart';
import 'custom_animated_textfield.dart';
import 'custom_animated_button.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 800,
          height: 500,
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade50, Colors.white],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Create an Account',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32.0),
                    CustomAnimatedTextField(
                      controller: emailController,
                      labelText: 'Email',
                    ),
                    const SizedBox(height: 16.0),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        CustomAnimatedTextField(
                          controller: passwordController,
                          labelText: 'Password',
                          obscureText: _obscurePassword,
                        ),
                        IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: _togglePasswordVisibility,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    CustomAnimatedTextField(
                      controller: confirmPasswordController,
                      labelText: 'Confirm Password',
                      obscureText: _obscurePassword,
                    ),
                    const SizedBox(height: 32.0),
                    CustomAnimatedTextButton(
                      text: 'Sign Up',
                      onPressed: () {
                        // Handle sign-up logic
                      },
                    ),
                    const SizedBox(height: 16.0),
                    CustomAnimatedTextButton(
                      text: 'Sign up with Google',
                      onPressed: () {
                        // Handle Google sign-up logic
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextButton(
                      onPressed: () {
                        // Navigate to sign-in page
                      },
                      child: const Text(
                        'Already have an account? Sign in',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}