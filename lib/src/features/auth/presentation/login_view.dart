import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart'
    show AppTextStyles, AppColors, AppTextFields, AppButton;
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/auth/index.dart' show AuthCard;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: MediaQuery.of(context).size.height * 0.15,
        ),
        child: Form(
          key: _formKey,
          child: AuthCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36),
                  child: Image.network(
                    'https://rawrecruit.in/assets/RR-Tagline-CmOUAebu.png',
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Welcome Back!',
                  style: AppTextStyles.s22W600.copyWith(color: AppColors.text),
                ),
                const SizedBox(height: 4),
                Text(
                  'Login to continue your journey.',
                  style: AppTextStyles.s14W400,
                ),
                const SizedBox(height: 20),
                AppTextFields(
                  controller: emailController,
                  hint: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email address is required';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 16),
                AppTextFields.password(
                  controller: passController,
                  hint: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),
                AppButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  foregroundColor: AppColors.background,
                  backgroundColor: AppColors.primary,
                  label: 'Login',
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  spacing: 16,
                  children: [
                    Expanded(child: Divider()),
                    Text('Or Continue with'),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 20),
                AppButton.outlined(
                  onPressed: () {},
                  foregroundColor: AppColors.background,
                  backgroundColor: AppColors.text,
                  label: 'Login with Google',
                ),
                const SizedBox(height: 12),
                AppButton.outlined(
                  onPressed: () {},
                  foregroundColor: AppColors.background,
                  backgroundColor: AppColors.text,
                  label: 'Login with LinkedIn',
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    context.pushReplacementNamed(RouteNames.register);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: AppTextStyles.s14W400,
                      ),
                      Text(
                        "Sign Up",
                        style: AppTextStyles.s14W600.copyWith(
                          color: AppColors.primary,
                          decorationColor: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
