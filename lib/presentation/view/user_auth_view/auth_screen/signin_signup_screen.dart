import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fooder/presentation/widgets/reusable_widget/custom_animated_button.dart';
import 'package:fooder/routes/app_routes.dart';

import '../../../../theme/app_color.dart';
import '../../../widgets/reusable_widget/custom_animated_textfield.dart';

class AuthToggleForm extends ConsumerStatefulWidget {
  const AuthToggleForm({super.key});

  @override
  _AuthToggleFormState createState() => _AuthToggleFormState();
}

class _AuthToggleFormState extends ConsumerState<AuthToggleForm> {
  bool isSignIn = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;

  void _toggleForm() {
    setState(() {
      isSignIn = !isSignIn;
    });
  }

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
                    const LanguageDropdown(), // Add LanguageDropdown widget here
                    const SizedBox(height: 16.0),
                    Text(
                      isSignIn ? 'Sign In' : 'Create an Account',
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
                    if (!isSignIn) ...[
                      const SizedBox(height: 16.0),
                      CustomAnimatedTextField(
                        controller: confirmPasswordController,
                        labelText: 'Confirm Password',
                        obscureText: _obscurePassword,
                      ),
                    ],
                    const SizedBox(height: 32.0),
                    CustomAnimatedTextButton(
                      text: isSignIn ? 'Sign In' : 'Sign Up',
                      onPressed: () {
                        // Handle sign-in or sign-up logic
                        if (isSignIn) {
                          Navigator.pushNamed(context, AppRoutes.homePage);
                        } else {
                          // Handle sign-up logic
                        }
                      },
                    ),
                    const SizedBox(height: 16.0),
                    CustomAnimatedTextButton(
                      text: isSignIn ? 'Sign in with Google' : 'Sign up with Google',
                      onPressed: () {
                        // Handle Google sign-in or sign-up logic
                      },
                    ),
                    if (isSignIn) ...[
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
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(isSignIn ? 'Don\'t have an account?' : 'Already have an account?'),
                        TextButton(
                          onPressed: _toggleForm,
                          child: Text(
                            isSignIn ? 'Sign Up' : 'Sign In',
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
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
    );
  }
}

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<Locale>(
        value: context.locale,
        icon: const Icon(Icons.language),
        onChanged: (Locale? newLocale) {
          if (newLocale != null) {
            context.setLocale(newLocale);
          }
        },
        items: context.supportedLocales.map<DropdownMenuItem<Locale>>((Locale locale) {
          return DropdownMenuItem<Locale>(
            value: locale,
            child: Text(locale.languageCode.toUpperCase()),
          );
        }).toList(),
      ),
    );
  }
}