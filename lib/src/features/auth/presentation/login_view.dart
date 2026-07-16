import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart'
    show AppTextStyles, AppTextFields, AppColors, AppButton;
import 'package:rawrecruit/src/core/index.dart'
    show RouteNames, Toasts, AppStateProvider, getIt;
import 'package:rawrecruit/src/features/auth/index.dart'
    show LoginViewModel, AuthCard;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController(
    text: kDebugMode ? 'namrahsarfaraz2006+test@gmail.com' : null,
  );
  final passController = TextEditingController(
    text: kDebugMode ? 'Test@123' : null,
  );

  final LoginViewModel loginViewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: loginViewModel,
      child: Scaffold(
        backgroundColor: Colors.black, // ✅ FIX
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: MediaQuery.of(context).size.height * 0.15,
          ),
          child: Form(
            key: _formKey,
            child: AuthCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /// 🔹 LOGO
                  //                   Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 80),
                  //   child: Image.asset(
                  //     'assets/images/img.png',
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  const SizedBox(height: 30),

                  /// 🔹 TITLE
                  Text(
                    'Welcome',
                    style: AppTextStyles.s22W600.copyWith(
                      color: Colors.white, // ✅ FIX
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    'Login to continue your journey.',
                    style: AppTextStyles.s14W400.copyWith(
                      color: Colors.grey, // ✅ FIX
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// 🔹 EMAIL
                  AppTextFields(
                    controller: emailController,
                    hint: 'Email Address',
                  ),

                  const SizedBox(height: 16),

                  /// 🔹 PASSWORD
                  AppTextFields.password(
                    controller: passController,
                    hint: 'Password',
                  ),

                  const SizedBox(height: 10),

                  Align(
                    alignment: AlignmentGeometry.centerRight,
                    child: InkWell(
                      onTap: () {
                        context.pushNamed(
                          RouteNames.forgotPassword,
                          extra: emailController.text.trim(),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: AppTextStyles.s14W600.copyWith(
                          color: AppColors.kGreen,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// 🔹 LOGIN BUTTON
                  AppButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final failure = await loginViewModel.login(
                          email: emailController.text.trim(),
                          password: passController.text.trim(),
                        );

                        Toasts.showSuccessOrFailureToast(
                          context,
                          failure: failure,
                          successMsg: 'Login Successful!',
                          popOnSuccess: false,
                          successCallback: () async {
                            await getIt<AppStateProvider>().getUserDetails();

                            if (getIt<AppStateProvider>().isProfileComplete) {
                              context.goNamed(
                                RouteNames.dashboard,
                                extra: {
                                  'userType':
                                      getIt<AppStateProvider>().userType,
                                },
                              );
                            } else {
                              context.goNamed(RouteNames.onboarding);
                            }
                          },
                        );
                      }
                    },
                    foregroundColor: Colors.black, // ✅ FIX
                    backgroundColor: AppColors.kGreen, // ✅ FIX
                    label: 'Login',
                  ),

                  const SizedBox(height: 20),

                  /// 🔹 DIVIDER
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.grey.withOpacity(0.3)),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Or Continue with',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Colors.grey.withOpacity(0.3)),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// 🔹 SOCIAL BUTTONS (MATCH REGISTER)
                  Column(
                    children: [
                      _socialButton(
                        icon: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/2991/2991148.png',
                          height: 18,
                        ),
                        text: "Continue with Google",
                        onTap: () async {
                          context.pushNamed(
                            RouteNames.userType,
                            extra: {'isLogging': true},
                          );
                        },
                      ),

                      const SizedBox(height: 12),

                      _socialButton(
                        icon: Image.asset(
                          'assets/images/linkedin.png',
                          height: 18,
                          width: 18,
                        ),
                        text: "Continue with LinkedIn",
                        onTap: () async {
                          context.pushNamed(
                            RouteNames.userType,
                            extra: {
                              'isLogging': true,
                              'isLinkedinLogging': true,
                            },
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// 🔹 SIGN UP
                  GestureDetector(
                    onTap: () {
                      context.pushReplacementNamed(RouteNames.userType);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: AppTextStyles.s14W400.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "Sign Up",
                          style: AppTextStyles.s14W600.copyWith(
                            color: AppColors.kGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _socialButton({
  required Widget icon,
  required String text,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.kBorder),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    ),
  );
}
