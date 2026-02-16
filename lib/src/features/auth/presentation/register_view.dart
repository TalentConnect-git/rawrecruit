import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart'
    show AppTextStyles, AppColors, AppTextFields, AppButton;
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/auth/index.dart'
    show AuthCard, UserTypeCard;

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final userTypeController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  final ValueNotifier<UserType?> _userTypeNotifier = ValueNotifier(null);

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
                  'Welcome User,',
                  style: AppTextStyles.s22W600.copyWith(color: AppColors.text),
                ),
                const SizedBox(height: 4),
                Text(
                  'Enter your detail to create an account.',
                  style: AppTextStyles.s14W400,
                ),
                const SizedBox(height: 20),
                Text(
                  'Select User Type',
                  style: AppTextStyles.s16W600.copyWith(color: AppColors.text),
                ),
                const SizedBox(height: 8),
                ValueListenableBuilder(
                  valueListenable: _userTypeNotifier,
                  builder: (_, selectedUserType, _) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...UserType.values.map(
                        (userType) => GestureDetector(
                          onTap: () {
                            _userTypeNotifier.value = userType;
                          },
                          child: UserTypeCard(
                            userType: userType,
                            isSelected: selectedUserType == userType,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
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
                // const SizedBox(height: 16),
                // AppTextFields.password(
                //   controller: confirmPassController,
                //   hint: 'Confirm Password',
                //   keyboardType: TextInputType.visiblePassword,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Confirm password is required';
                //     }
                //
                //     return null;
                //   },
                // ),
                const SizedBox(height: 20),
                AppButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  foregroundColor: AppColors.background,
                  backgroundColor: AppColors.primary,
                  label: 'Register',
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
                  label: 'Register with Google',
                ),
                const SizedBox(height: 12),
                AppButton.outlined(
                  onPressed: () {},
                  foregroundColor: AppColors.background,
                  backgroundColor: AppColors.text,
                  label: 'Register with LinkedIn',
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    context.pushReplacementNamed(RouteNames.login);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: AppTextStyles.s14W400,
                      ),
                      Text(
                        "Login",
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
